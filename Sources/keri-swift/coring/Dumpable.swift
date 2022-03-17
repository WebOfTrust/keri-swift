//
// Created by Kevin Griffin on 2/28/22.
//

import Foundation
import RNJSON

/// Dumpable
protocol Dumpable: Encodable {
    func kind() -> Serial
}

enum DumpableErrors: Error, Equatable {
    case notImplemented(Serial)
    case invalidSerializationKind(Serial)
}

extension Dumpable {
    func dumps() throws -> [UInt8] {
        switch kind() {
        case .json:
            let data = try RNJSONEncoder().encode(self)
            return [UInt8](data)
        case .cbor, .mgpk:
            throw DumpableErrors.notImplemented(kind())
        }
    }
}
