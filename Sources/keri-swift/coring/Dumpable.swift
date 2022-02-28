//
// Created by Kevin Griffin on 2/28/22.
//

import Foundation
import RNJSON

/// Dumpable
protocol Dumpable: Encodable {
    var kind: Serial { get set }
}

enum DumpableErrors: Error, Equatable {
    case notImplemented(Serial)
    case invalidSerializationKind(Serial)
}

extension Dumpable {
    func dumps() throws -> [UInt8] {
        switch kind {
        case .json:
            return try [UInt8](RNJSONEncoder().encode(self))
        case .cbor, .mgpk:
            throw DumpableErrors.notImplemented(kind)
        }
    }
}
