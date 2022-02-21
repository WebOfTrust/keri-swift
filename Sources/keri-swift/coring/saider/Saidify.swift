//
// Created by Kevin Griffin on 2/16/22.
//

import BLAKE3
import Collections
import ExtrasBase64
import Foundation

protocol Saidify: Sizeify {
    var sad: OrderedDictionary<String, Any> { get set }
}

extension Saidify {
    /// Saider is Matter subclass for self-addressing identifier prefix using
    /// derivation as determined by code from ked
    ///
    /// - Parameters:
    ///   - sad: self addressed data to serialize and inject said
    ///   - code: derivation code to indicate cypher suite
    ///   - kind: serialization algorithm of sad, one of Serials
    ///           used to override that given by 'v' field if any in sad
    ///           otherwise default is Serials.json
    ///   - label: id field label, one of Ids
    /// - Throws:
    func saidify(sad: inout OrderedDictionary<String, Any>,
                 code: String = MatterCodex[MatterCodes.Blake3_256]!,
                 kind: Serial = .json,
                 label: Id = Id.d) throws
    {
        if !sad.keys.contains(label.rawValue) {
            throw SaiderErrors.labelNotFound
        }

        if code != MatterCodex[MatterCodes.Blake3_256]! {
            throw SaiderErrors.invalidCode(code)
        }

        guard let size = MatterSizes[code] else {
            throw SaiderErrors.invalidCode(code)
        }

        sad[label.rawValue] = String(repeating: "#", count: size.fs!)

        var raw: [UInt8]
        if sad.keys.contains("v") { // specific to KERI
            (raw, _, _) = try sizeify(ked: &sad, kind: kind)
        } else {
            raw = try dumps(ked: sad, kind: kind)
        }

        let hashed = BLAKE3.hash(contentsOf: raw)
        sad[label.rawValue] = Base64.encodeString(bytes: hashed)
    }
}
