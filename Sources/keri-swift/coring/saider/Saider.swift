//
// Created by Kevin Griffin on 2/16/22.
//

import Foundation

/// Saider
///
struct Saider {
    /// dummy placeholder char for said. Must not be a valid Base64 char
    let dummy: String = "#"

    private let m: Matter?

    init(raw: [UInt8], code: String) throws {
        if !raw.isEmpty, !code.isEmpty {
            self.m = try Matter(raw: raw, code: code)
        } else {
            throw SaiderErrors.badInitialization
        }
    }

    static func saidify(sad: [String: Any] = [:],
                        code: String = MatterCodex[MatterCodes.Blake3_256]!,
                        kind: Serial = .json,
                        label: Id = Id.d)
    {
        if sad.keys.contains(label.rawValue) {}
//        if label not in sad:
//        raise KeyError("Missing id field labeled={} in sad.".format(label))
//        raw, sad = clas._derive(sad=sad, code=code, kind=kind, label=label)
//        saider = clas(raw=raw, code=code, kind=kind, label=label, **kwa)
//        sad[label] = saider.qb64
    }
}
