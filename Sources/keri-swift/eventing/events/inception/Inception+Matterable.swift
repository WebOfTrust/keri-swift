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

    func qb64() -> String {
        ""
    }

    func qb64b() -> [UInt8] {
        []
    }

    func qb2() -> [UInt8] {
        []
    }

    func size() -> Int {
        0
    }

    func transferable() -> Bool {
        true
    }

    func digestive() -> Bool {
        true
    }
}
