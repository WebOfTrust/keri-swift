//
// Created by Kevin Griffin on 2/17/22.
//

import BLAKE3
import Collections
import ExtrasBase64
import Foundation
import RNJSON

struct Saider {
    public init() {}

    /// Saider is Matter subclass for self-addressing identifier prefix using
    /// derivation as determined by code from ked
    ///
    /// - Parameters:
    ///   - sad: self addressed data to serialize and inject said
    /// - Throws:
    static func saidify(sad: inout Saidable) throws {
        let size = matterSizes[matterCodex[MatterCodes.Blake3_256]!]!

        // pad id to match final size
        sad.setId(v: String(repeating: "#", count: size.fs!))

        // perform any additional calls before hashing, designated by protocol conformance
        // Example: recalculate the version string before final hashing
        sad.preHash()

        sad.setId(v: Base64.encodeString(bytes: BLAKE3.hash(contentsOf: try sad.dumps())))
    }
}
