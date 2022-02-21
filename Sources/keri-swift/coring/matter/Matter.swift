//
//  Matter.swift
//
//
//  Created by Kevin Griffin on 2/2/22.
//

import ExtrasBase64
import Foundation

public struct Matter {
    private var pad: Int = 0

    private var _code: String
    /// Derivation code
    public var code: String {
        self._code
    }

    private var _size: Int?
    /// number of quadlets of variable sized material else nil if not variable sized matter
    public var size: Int? {
        self._size
    }

    private var _raw: [UInt8]
    /// Unqualified crypto material usable for crypto operations
    public var raw: [UInt8] {
        self._raw
    }

    /// Fully qualified Base64 version
    public func qb64() throws -> String? {
        try self.infil()
    }

    /// Base64 fully qualified with derivation code + crypto mat
    public func qb64b() throws -> [UInt8]? {
        guard let b64 = try qb64() else {
            return nil
        }

        return try Base64.decode(string: b64, options: .base64UrlAlphabet)
    }

    /// Fully Qualified Binary Version Bytes
    public func qb2() -> [UInt8]? {
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
    public init(raw: [UInt8]? = [UInt8](),
                qb2: [UInt8]? = [UInt8](),
                qb64: String? = "",
                code: String = MatterCodex[MatterCodes.Ed25519N]!) throws
    {
        self._raw = raw!
        self._code = code

        self.pad = self._pad()

        if !self._raw.isEmpty {
            if self.pad == 1 {
                if !self.OneCharacterCodes.contains(self._code) {
                    throw MatterErrors.invalidCode(code: self._code, pad: self.pad)
                }
            }

            if self.pad == 2 {
                if !self.TwoCharacterCodes.contains(self._code) {
                    throw MatterErrors.invalidCode(code: self._code, pad: self.pad)
                }
            }

            if self.pad == 0 {
                if !self.FourCharacterCodes.contains(self._code) {
                    throw MatterErrors.invalidCode(code: self._code, pad: self.pad)
                }
            }

            guard let sizage = MatterSizes[code] else {
                throw MatterErrors.missingSizageForCode(code: self._code)
            }

            let expectedRawSize = Int(floor(Double((sizage.fs! - (sizage.hs + sizage.ss)) * 3) / 4)) - sizage.ls
            if self._raw.count != expectedRawSize {
                throw MatterErrors.mismatchedRawSize(actual: self._raw.count, expected: expectedRawSize)
            }

        } else if !qb64!.isEmpty {
            try? self.exfil(_qb64: qb64!)
        } else if !qb2!.isEmpty {
            try? self.exfil(_qb64: Base64.encodeString(bytes: qb2!, options: .base64UrlAlphabet))
        } else {
            throw MatterErrors.improperInitialization
        }
    }

    /// returns string of fully qualified Base64 characters
    // _code + converted _raw to Base64 with pad chars stripped
    private func infil() throws -> String? {
        let p: Int = self._pad()
        let cc: Int = self._code.count

        if cc % 4 != p {
            throw MatterErrors.invalidCodeForPad(code: self._code, pad: p)
        }

        // convert raw to Base64 including padding
        var b64 = Base64.encodeString(bytes: self._raw, options: .base64UrlAlphabet)

        // check padding against count
        let padding = b64.filter {
            $0 == "="
        }
        .map {
            $0
        }
        .count
        if cc != padding {
            logger.error("Mismatched padding count")
        }

        // remove padding
        b64.remove(at: b64.index(b64.endIndex, offsetBy: -self.code.count))

        // add code
        return self._code + b64
    }

    // Extracts _code and _raw from qualified Base64
    private mutating func exfil(_qb64: String) throws {
        var codeSize = 1
        var code = String(_qb64.prefix(codeSize))
        let qb64: String
        let fullSize: Int

        if let size = MatterSizes[code] {
            // strip derivation code
            qb64 = String(_qb64[_qb64.index(_qb64.startIndex, offsetBy: codeSize) ..< _qb64.endIndex])

            // verify remaining size is as expected
            if qb64.count > size.fs! {
                throw MatterErrors.invalidSizeForCode(code: code, got: qb64.count, expected: size.fs!)
            }
            fullSize = size.fs!
        } else if code == MatterSelectCodex[MatterSelectCodes.Two] {
            codeSize += 1
            code = String(_qb64.prefix(codeSize))

            guard let size = MatterSizes[code] else {
                throw MatterErrors.invalidDerivationCode(code: code, in: _qb64)
            }

            qb64 = String(_qb64[_qb64.index(_qb64.startIndex, offsetBy: codeSize) ..< _qb64.endIndex])
            if qb64.count > size.fs! {
                throw MatterErrors.invalidSizeForCode(code: code, got: qb64.count, expected: size.fs!)
            }
            fullSize = size.fs!
        } else if code == MatterSelectCodex[MatterSelectCodes.Four] {
            codeSize += 3
            code = String(_qb64.prefix(codeSize))

            guard let size = MatterSizes[code] else {
                throw MatterErrors.invalidDerivationCode(code: code, in: _qb64)
            }

            qb64 = String(_qb64[_qb64.index(_qb64.startIndex, offsetBy: codeSize) ..< _qb64.endIndex])
            if qb64.count > size.fs! {
                throw MatterErrors.invalidSizeForCode(code: code, got: qb64.count, expected: size.fs!)
            }
            fullSize = size.fs!
        } else if code == MatterSelectCodex[MatterSelectCodes.Dash] {
            codeSize += 1
            code = String(_qb64.prefix(codeSize))

            guard let size = MatterCountSizes[code] else {
                throw MatterErrors.invalidDerivationCode(code: code, in: _qb64)
            }

            qb64 = String(_qb64[_qb64.index(_qb64.startIndex, offsetBy: codeSize)
                    ..< _qb64.index(_qb64.startIndex, offsetBy: size.fs!)])
            try self._size = B64ToInt(s: qb64)
            fullSize = size.fs!
        } else {
            throw MatterErrors.improperlyCodedMaterial(_: _qb64)
        }

        if _qb64.count != fullSize {
            throw MatterErrors.invalidSizeForCode(code: code, got: qb64.count, expected: fullSize)
        }

        // qb64 should be stripped of it's code above, just pad
        let derivedRaw = try Base64.decode(string:
            String(qb64 + String(repeating: "=", count: codeSize % 4)), options: .base64UrlAlphabet)
        if derivedRaw.count != Int(floor(Double(((_qb64.count - codeSize) * 3) / 4))) {
            throw MatterErrors.improperlyCodedMaterial(_qb64)
        }

        self._raw = derivedRaw
        self._code = code
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

    public let TwoCharacterCodes: [String] = MatterSizes.filter {
        $0.key.count == 2
    }
    .map(\.key)

    public let FourCharacterCodes: [String] = MatterSizes.filter {
        $0.key.count == 4
    }
    .map(\.key)
}
