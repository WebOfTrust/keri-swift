//
// Created by Kevin Griffin on 2/28/22.
//

import Foundation
import RNJSON

protocol Loadable: Decodable {
    static func loads(raw: [UInt8], kind: Serial) throws -> Self
}

enum LoadableErrors: Error, Equatable {
    case notImplemented(Serial)
    case invalidDeserializationKind(Serial)
}

extension Loadable {
    /// loads from [UInt8] with optional Serial, defaults to .json
    /// - Parameters:
    ///   - raw: raw serialization to deserialize as dictionary
    ///   - kind: serialization kind (JSON, MGPK, CBOR)
    /// - Returns: deserialized ked
    /// - Throws:
    static func loads(raw: [UInt8], kind: Serial) throws -> Self {
        switch kind {
        case .json:
            return try RNJSONDecoder().decode(Self.self, from: Data(raw))
        case .cbor, .mgpk:
            throw LoadableErrors.notImplemented(kind)
        }
    }
}
