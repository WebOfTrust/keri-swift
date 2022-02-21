//
// Created by Kevin Griffin on 2/14/22.
//

import Foundation

public enum Ilk: String, Codable {
    case ilk // ilk is short for message type
    case icp // icp = incept, inception
    case rot // rot = rotate, rotation
    case ort // ort = rotate, partial rotation
    case dor // dor = rotate, partial delegated rotation
    case ixn // ixn = interact, interaction
    case dip // dip = delcept, delegated inception
    case drt // drt = deltate, delegated rotation
    case rct // rct = receipt
    case ksn // ksn = state, key state notice
    case qry // qry = query
    case rpy // rpy = reply
    case exn // exn = exchange
    case exp // exp = expose, sealed data exposition
    case fwd // fwd = forward, ??
    case vcp // vcp = vdr incept, verifiable data registry inception
    case vrt // vrt = vdr rotate, verifiable data registry rotation
    case iss // iss = vc issue, verifiable credential issuance
    case rev // rev = vc revoke, verifiable credential revocation
    case bis // bis = backed vc issue, registry-backed transaction event log credential issuance
    case brv // brv = backed vc revoke, registry-backed transaction event log credential revocation
}

extension Ilk: Comparable {
    public static func < (lhs: Ilk, rhs: Ilk) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
}

public let Ilks: Set<Ilk> = [
    .icp,
    .rot,
    .ort,
    .ixn,
    .dip,
    .drt,
    .rct,
    .ksn,
    .qry,
    .rpy,
    .exn,
    .exp,
    .fwd,
    .vcp,
    .iss,
    .rev,
    .bis,
    .brv,
    .vrt,
]
