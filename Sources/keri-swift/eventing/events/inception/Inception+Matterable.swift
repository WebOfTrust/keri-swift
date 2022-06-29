//
// Created by Kevin Griffin on 3/15/22.
//

import Foundation

extension ICP: Matterable {
    func code() -> String {
        self._code
    }

    func raw() -> [UInt8] {
        do {
            return try self.dumps()
        } catch {
            return []
        }
    }

    func qb64() throws -> String {
        try infil(self.code(), self.raw())
    }

    func qb64b() throws -> [UInt8] {
        guard let b64 = try qb64() else {
            return nil
        }

        return try Base64.decode(string: b64, options: .base64UrlAlphabet)
    }

    func qb2() throws -> [UInt8] {
        try Base64.decode(string: self.qb64(), options: .base64UrlAlphabet)
    }

    func size() -> Int {
        self._size
    }

    func transferable() -> Bool {
        true
    }

    func digestive() -> Bool {
        digCodex.contains(self._code)
    }
}
