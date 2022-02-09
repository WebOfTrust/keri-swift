//
//  Matter.swift
//
//
//  Created by Kevin Griffin on 2/2/22.
//

import ExtrasBase64
import Foundation
import Sodium

public struct Matter {
    private let sodium = Sodium()
    private var pad: Int = 0

    private var _code: String
    /// Derivation code
    public var code: String {
        self._code
    }

    private var _raw: Bytes
    /// Unqualified crypto material usable for crypto operations
    public var raw: Bytes {
        self._raw
    }

    /// Fully qualified Base64 version
    public func qb64() -> String? {
        self.infil()
    }

    /// Base64 fully qualified with derivation code + crypto mat
    public func qb64b() -> Bytes? {
        guard let b64 = qb64() else {
            return nil
        }
        return self.sodium.utils.base642bin(b64, variant: .URLSAFE)
    }

    /// Fully Qualified Binary Version Bytes
    public func qb2() -> Bytes? {
        try? Base64.decode(string: self.qb64()!, options: .base64UrlAlphabet)
    }

    /**
     Base for all cryptographic material
     - Parameters:
        - raw: unqualified crypto material usable for crypto operations
        - qb2: fully qualified base2
        - qb64: fully qualified crypto material
        - code: derivation code

     - Returns: Matter
     */
    public init(raw: Bytes? = Bytes(),
                qb2: Bytes? = Bytes(),
                qb64: String? = "",
                code: String = MatterCodex[MatterCodes.Ed25519N]!) throws
    {
        self._raw = raw!
        self._code = code

        self.pad = self._pad()

        if self._raw.count > 0 {
            if self.pad == 1 {
                if !self.OneCharacterCodes.contains(self._code) {
                    throw MatterError.invalidCode(code: self._code, pad: self.pad)
                }
            }

            if self.pad == 2 {
                if !self.TwoCharacterCodes.contains(self._code) {
                    throw MatterError.invalidCode(code: self._code, pad: self.pad)
                }
            }

            if self.pad == 0 {
                if !self.FourCharacterCodes.contains(self._code) {
                    throw MatterError.invalidCode(code: self._code, pad: self.pad)
                }
            }

            guard let sizage = MatterSizes[code] else {
                throw MatterError.missingSizageForCode(code: self._code)
            }

            let expectedRawSize = Int(floor(Double((sizage.fs! - (sizage.hs + sizage.ss)) * 3) / 4)) - sizage.ls
            if self._raw.count != expectedRawSize {
                throw MatterError.mismatchedRawSize(actual: self._raw.count, expected: expectedRawSize)
            }

        } else if qb64!.count > 0 {
            self.exfil(_qb64: qb64!)
        } else if qb2!.count > 0 {
            self.exfil(_qb64: Base64.encodeString(bytes: qb2!, options: .base64UrlAlphabet))
        } else {
            throw MatterError.improperInitialization
        }
    }

    /// returns string of fully qualified Base64 characters
    // _code + converted _raw to Base64 with pad chars stripped
    private func infil() -> String? {
        let p = self._pad()
        let cc = self._code.count
        if cc % 4 != p {
            logger.error("Invalid code for pad")
            return nil
        }

        // convert raw to Base64 including padding
        var b64 = self.sodium.utils.bin2base64(self._raw, variant: .URLSAFE)!

        // check padding against count
        let padding = b64.filter { $0 == "=" }.map { $0 }.count
        if cc != padding {
            logger.error("Mismatched padding count")
        }

        // remove padding
        b64.remove(at: b64.index(b64.endIndex, offsetBy: -self.code.count))

        // add code
        return self._code + b64
    }

    // Extracts _code and _raw from qualified Base64
    private mutating func exfil(_qb64: String) {
        for codeSize in [1, 2, 4] {
            // derivation codes should be appended to qb64
            let code = String(_qb64.prefix(codeSize))
            // check Matter codex for existence of code
            if let _ = MatterSizes[code] {
                self._code = code
                self._raw = self.sodium.utils.base642bin(
                    // remove prepended derivation code
                    String(_qb64[_qb64.index(_qb64.startIndex, offsetBy: codeSize) ..< _qb64.endIndex] +
                        // append corresponding pad characters
                        String(repeating: "=", count: codeSize)), variant: .URLSAFE
                )!
            }
            break
        }
    }

    private func _pad() -> Int {
        let remainder = self._raw.count % 3
        if remainder == 0 {
            return 0
        }

        return 3 - remainder
    }

    public let OneCharacterCodes: [String] = MatterSizes.filter {
        $0.key.count == 1
    }
    .map(\.key)

    public let TwoCharacterCodes = MatterSizes.filter {
        $0.key.count == 2
    }
    .map(\.key)

    public let FourCharacterCodes = MatterSizes.filter {
        $0.key.count == 4
    }
    .map(\.key)
}
