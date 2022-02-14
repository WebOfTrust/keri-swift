//
// Created by Kevin Griffin on 2/14/22.
//

import Foundation

/// Diger used to verify the digest of serialization
struct Diger {
    let matter: Matter

    init(raw: [UInt8], qb64: String? = "", code: String = MatterCodex[MatterCodes.Blake3_256]!) throws {
        if raw.count > 0 {
            self.matter = try Matter(raw: raw, code: code)
        } else {
            throw DigerErrors.unsupported
        }
    }
}
