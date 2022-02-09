//
//  Matter.swift
//  
//
//  Created by Kevin Griffin on 2/2/22.
//

import Foundation
import Sodium
import ExtrasBase64

public struct Matter {
    private let sodium = Sodium()
    private var pad: Int = 0

    private var _code: String
    /// Derivation code
    public var code: String {
        _code
    }

    private var _raw: Bytes
    /// Unqualified crypto material usable for crypto operations
    public var raw: Bytes {
        _raw
    }

    /// Fully qualified Base64 version
    public func qb64() -> String? {
        infil()
    }

    /// Base64 fully qualified with derivation code + crypto mat
    public func qb64b() -> Bytes? {
        guard let b64 = qb64() else {
            return nil
        }
        return sodium.utils.base642bin(b64, variant: .URLSAFE)
    }

    /// Fully Qualified Binary Version Bytes
    public func qb2() -> Bytes? {
        try? Base64.decode(string: qb64()!, options: .base64UrlAlphabet)
    }

    /**
     Base for all cryptographic material
     - Parameters:
        - raw: unqualified crypto material usable for crypto operations
        - qb64: fully qualified crypto material
        - code: derivation code

     - Returns: Matter
     */
    public init(raw: Bytes? = Bytes(),
                qb2: Bytes? = Bytes(),
                qb64: String? = "",
                code: String = MatterCodex[MatterCodes.Ed25519N]!) throws {

        _raw = raw!
        _code = code

        pad = _pad()

        if _raw.count > 0 {
            if pad == 1 {
                if !OneCharacterCodes.contains(_code) {
                    throw MatterError.invalidCode(code: _code, pad: pad)
                }
            }

            if pad == 2 {
                if !TwoCharacterCodes.contains(_code) {
                    throw MatterError.invalidCode(code: _code, pad: pad)
                }
            }

            if pad == 0 {
                if !FourCharacterCodes.contains(_code) {
                    throw MatterError.invalidCode(code: _code, pad: pad)
                }
            }

            guard let sizage = MatterSizes[code] else {
                throw MatterError.missingSizageForCode(code: _code)
            }

            let expectedRawSize = Int(floor(Double(((sizage.fs! - (sizage.hs + sizage.ss))) * 3) / 4)) - sizage.ls
            if _raw.count != expectedRawSize {
                throw MatterError.mismatchedRawSize(actual: _raw.count, expected: expectedRawSize)
            }

        } else if qb64!.count > 0 {
            exfil(_qb64: qb64!)
        } else if qb2!.count > 0 {
            exfil(_qb64: Base64.encodeString(bytes: qb2!, options: .base64UrlAlphabet))
        } else {
            throw MatterError.improperInitialization
        }
    }

    /// returns string of fully qualified Base64 characters
    // _code + converted _raw to Base64 with pad chars stripped
    private func infil() -> String? {
        let p = _pad()
        let cc = _code.count
        if cc % 4 != p {
            logger.error("Invalid code for pad")
            return nil
        }

        // convert raw to Base64 including padding
        var b64 = sodium.utils.bin2base64(_raw, variant: .URLSAFE)!

        // check padding against count
        let padding = b64.filter({ $0 == "=" }).map({ $0 }).count
        if cc != padding {
            logger.error("Mismatched padding count")
        }

        // remove padding
        b64.remove(at: b64.index(b64.endIndex, offsetBy: -code.count))

        // add code
        return _code + b64
    }

    // Extracts _code and _raw from qualified Base64
    mutating private func exfil(_qb64: String) {
        for codeSize in [1, 2, 4] {
            // derivation codes should be appended to qb64
            let code = String(_qb64.prefix(codeSize))
            // check Matter codex for existence of code
            if let _ = MatterSizes[code] {
                _code = code
                _raw = sodium.utils.base642bin(
                        // remove prepended derivation code
                        String(_qb64[_qb64.index(_qb64.startIndex, offsetBy: codeSize)..<_qb64.endIndex] +
                                // append corresponding pad characters
                                String(repeating: "=", count: codeSize)), variant: .URLSAFE)!
            }
            break
        }
    }

    private func _pad() -> Int {
        let remainder = _raw.count % 3
        if remainder == 0 {
            return 0
        }

        return 3 - remainder
    }

    public let OneCharacterCodes: [String] = MatterSizes.filter {
                $0.key.count == 1
            }
            .map {
                $0.key
            }
    public let TwoCharacterCodes = MatterSizes.filter {
                $0.key.count == 2
            }
            .map {
                $0.key
            }
    public let FourCharacterCodes = MatterSizes.filter {
                $0.key.count == 4
            }
            .map {
                $0.key
            }
}
