//
// Created by Kevin Griffin on 3/7/22.
//

import Foundation
import Sodium

struct Prefixer {
    static func prefix(qb64: String) {}

        static func prefix<T>(a: Any, t: T.Type, code: String) throws {
        guard let p = a as? Prefixbale else {
            throw PrefixerErrors.invalidEvent
        }

        switch p.ilk() {
        case .icp, .dip, .vcp:
            break
        default:
            throw PrefixerErrors.invalidIlk(p.ilk())
        }

        // does event have keys

        // does

        switch code {
        case matterCodex[MatterCodes.Ed25519N]!, matterCodex[MatterCodes.Ed25519]!:
            _ = Sodium()
//            print(sodium.sign.verify(message: p.raw(), publicKey: p.keys()[0].bytes, signature: "".bytes))
            guard let a = a as? ICP else {
                throw PrefixerErrors.invalidEvent
            }
            print(a)
        default:
            throw PrefixerErrors.invalidCode(code)
        }
    }
}
