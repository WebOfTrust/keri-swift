//
// Created by Kevin Griffin on 3/8/22.
//

import Foundation

func incept(keys: [String],
            sith: Int,
            nxt: String,
            toad: Int = 0,
            wits: [String]? = [],
            cnfg: [String]? = [],
            data: [EventSeal]? = [],
            vers: Versionage? = verzion,
            kind: Serial? = .json,
            code: String) throws -> ICP
{
    let vs = versify(ident: .keri, version: vers!, kind: kind!, size: 0)

    let _ = try Tholder(sith: sith)

    if !wits!.isEmpty {
        if toad < 1 || toad > wits!.count {
            throw EventingErrors.invalidToadForWits
        }
    } else {
        if toad != 0 {
            throw EventingErrors.missingToadForWits
        }
    }

    let icp = ICP(v: vs,
                  t: .icp,
                  d: "",
                  i: "",
                  s: 0,
                  kt: sith,
                  k: keys,
                  n: nxt,
                  bt: toad,
                  b: wits!,
                  c: cnfg!)

    print(code)
    if code == "", keys.count == 1 {
        // not self addressing
        print("I'll implement this")
    } else {
        try Prefixer.prefix(a: icp, t: ICP.self, code: code)
    }

    if digCodex.contains(code) {
    } else {
//        try Saider.saidify(sad: &icp as Saidable)
    }

    return icp
}
