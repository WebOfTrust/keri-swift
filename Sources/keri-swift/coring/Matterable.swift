//
// Created by Kevin Griffin on 3/17/22.
//

import ExtrasBase64
import Foundation

protocol Matterable {
    func raw() -> [UInt8]
    func code() -> String
    func size() -> Int
    func qb64() throws -> String
    func qb64b() throws -> [UInt8]
    func qb2() throws -> [UInt8]
    func transferable() -> Bool
    func digestive() -> Bool
}

extension Matterable {
    // Extracts _code and _raw from qualified Base64
    func exfil(_qb64: String) throws -> (String, [UInt8]) {
        let qb64: String
        let fullSize: Int

        var codeSize = 1
        var code = String(_qb64.prefix(codeSize))

        if let size = matterSizes[code] {
            // strip derivation code
            qb64 = String(_qb64[_qb64.index(_qb64.startIndex, offsetBy: codeSize) ..< _qb64.endIndex])

            // verify remaining size is as expected
            if qb64.count > size.fs! {
                throw MatterErrors.invalidSizeForCode(code: code, got: qb64.count, expected: size.fs!)
            }
            fullSize = size.fs!
        } else if code == matterSelectCodex[MatterSelectCodes.two] {
            codeSize += 1
            code = String(_qb64.prefix(codeSize))

            guard let size = matterSizes[code] else {
                throw MatterErrors.invalidDerivationCode(code: code, in: _qb64)
            }

            qb64 = String(_qb64[_qb64.index(_qb64.startIndex, offsetBy: codeSize) ..< _qb64.endIndex])
            if qb64.count > size.fs! {
                throw MatterErrors.invalidSizeForCode(code: code, got: qb64.count, expected: size.fs!)
            }
            fullSize = size.fs!
        } else if code == matterSelectCodex[MatterSelectCodes.four] {
            codeSize += 3
            code = String(_qb64.prefix(codeSize))

            guard let size = matterSizes[code] else {
                throw MatterErrors.invalidDerivationCode(code: code, in: _qb64)
            }

            qb64 = String(_qb64[_qb64.index(_qb64.startIndex, offsetBy: codeSize) ..< _qb64.endIndex])
            if qb64.count > size.fs! {
                throw MatterErrors.invalidSizeForCode(code: code, got: qb64.count, expected: size.fs!)
            }
            fullSize = size.fs!
        } else if code == matterSelectCodex[MatterSelectCodes.dash] {
            codeSize += 1
            code = String(_qb64.prefix(codeSize))

            guard let size = matterCountSizes[code] else {
                throw MatterErrors.invalidDerivationCode(code: code, in: _qb64)
            }

            qb64 = String(_qb64[_qb64.index(_qb64.startIndex, offsetBy: codeSize)
                    ..< _qb64.index(_qb64.startIndex, offsetBy: size.fs!)])
//        try size = b64ToInt(s: qb64)
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

        return (code, derivedRaw)
    }

    private func _pad(raw: [UInt8]) -> Int {
        let remainder = raw.count % 3
        if remainder == 0 {
            return 0
        }

        return 3 - remainder
    }

    /// returns string of fully qualified Base64 characters
    // _code + converted _raw to Base64 with pad chars stripped
    func infil(code: String, raw: [UInt8]) throws -> String? {
        let p: Int = self._pad(raw: raw)
        let cc: Int = code.count

        if cc % 4 != p {
            throw MatterErrors.invalidCodeForPad(code: code, pad: p)
        }

        // convert raw to Base64 including padding
        var b64 = Base64.encodeString(bytes: raw, options: .base64UrlAlphabet)

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
        b64.remove(at: b64.index(b64.endIndex, offsetBy: -code.count))

        // add code
        return code + b64
    }
}
