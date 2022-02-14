//
// Created by Kevin Griffin on 2/14/22.
//

import Foundation

//        .raw is bytes of serialized event only
//        .ked is key event dict
//        .kind is serialization kind string value (see namedtuple coring.Serials)
//        .version is Versionage instance of event version
//        .size is int of number of bytes in serialed event only
//        .diger is Diger instance of digest of .raw
//        .dig  is qb64 digest from .diger
//        .digb is qb64b digest from .diger
//        .verfers is list of Verfers converted from .ked["k"]
//        .werfers is list of Verfers converted from .ked["b"]
//        .tholder is Tholder instance from .ked["kt'] else None
//        .sn is int sequence number converted from .ked["s"]
//        .pre is qb64 str of identifier prefix from .ked["i"]
//        .preb is qb64b bytes of identifier prefix from .ked["i"]
//        .said is qb64 of .ked['d'] if present
//        .saidb is qb64b of .ked['d'] of present

/// Serder is KERI key event serializer-deserializer class
// Only supports current version VERSION
struct Serder {
//    init(raw: [UInt8] = [], ked = [:], kind, sad, code = MatterCodex[MatterCodes.Blake3_256]) {}
}
