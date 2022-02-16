//
// Created by Kevin Griffin on 2/4/22.
//

import Foundation

/// Sizage (hs, ss, fs, ls) where hs is hard size, ss is soft size, and fs is full size
/// and ls is lead size soft size, ss, should always be 0 for Matter unless fs is 0 which allows
/// for variable size multiple of 4, i.e. not (hs + ss) % 4.
public typealias Sizage = (hs: Int, ss: Int, fs: Int?, ls: Int)

public let MatterSizes: [String: Sizage] = [
    MatterCodex[MatterCodes.Ed25519_Seed]!: Sizage(hs: 1, ss: 0, fs: 44, ls: 0),
    MatterCodex[MatterCodes.Ed25519N]!: Sizage(hs: 1, ss: 0, fs: 44, ls: 0),
    MatterCodex[MatterCodes.X25519]!: Sizage(hs: 1, ss: 0, fs: 44, ls: 0),
    MatterCodex[MatterCodes.Ed25519]!: Sizage(hs: 1, ss: 0, fs: 44, ls: 0),
    MatterCodex[MatterCodes.Blake3_256]!: Sizage(hs: 1, ss: 0, fs: 44, ls: 0),
    MatterCodex[MatterCodes.Blake2b_256]!: Sizage(hs: 1, ss: 0, fs: 44, ls: 0),
    MatterCodex[MatterCodes.Blake2s_256]!: Sizage(hs: 1, ss: 0, fs: 44, ls: 0),
    MatterCodex[MatterCodes.SHA3_256]!: Sizage(hs: 1, ss: 0, fs: 44, ls: 0),
    MatterCodex[MatterCodes.SHA2_256]!: Sizage(hs: 1, ss: 0, fs: 44, ls: 0),
    MatterCodex[MatterCodes.ECDSA_256k1_Seed]!: Sizage(hs: 1, ss: 0, fs: 44, ls: 0),
    MatterCodex[MatterCodes.Ed448_Seed]!: Sizage(hs: 1, ss: 0, fs: 76, ls: 0),
    MatterCodex[MatterCodes.X448]!: Sizage(hs: 1, ss: 0, fs: 76, ls: 0),
    MatterCodex[MatterCodes.Short]!: Sizage(hs: 1, ss: 0, fs: 4, ls: 0),
    MatterCodex[MatterCodes.Big]!: Sizage(hs: 1, ss: 0, fs: 12, ls: 0),
    MatterCodex[MatterCodes.X25519_Private]!: Sizage(hs: 1, ss: 0, fs: 44, ls: 0),
    MatterCodex[MatterCodes.X25519_Cipher_Seed]!: Sizage(hs: 1, ss: 0, fs: 124, ls: 0),
    MatterCodex[MatterCodes.Salt_128]!: Sizage(hs: 2, ss: 0, fs: 24, ls: 0),
    MatterCodex[MatterCodes.Ed25519_Sig]!: Sizage(hs: 2, ss: 0, fs: 88, ls: 0),
    MatterCodex[MatterCodes.ECDSA_256k1_Sig]!: Sizage(hs: 2, ss: 0, fs: 88, ls: 0),
    MatterCodex[MatterCodes.Blake3_512]!: Sizage(hs: 2, ss: 0, fs: 88, ls: 0),
    MatterCodex[MatterCodes.Blake2b_512]!: Sizage(hs: 2, ss: 0, fs: 88, ls: 0),
    MatterCodex[MatterCodes.SHA3_512]!: Sizage(hs: 2, ss: 0, fs: 88, ls: 0),
    MatterCodex[MatterCodes.SHA2_512]!: Sizage(hs: 2, ss: 0, fs: 88, ls: 0),
    MatterCodex[MatterCodes.Long]!: Sizage(hs: 2, ss: 0, fs: 8, ls: 0),
    MatterCodex[MatterCodes.ECDSA_256k1N]!: Sizage(hs: 4, ss: 0, fs: 48, ls: 0),
    MatterCodex[MatterCodes.ECDSA_256k1]!: Sizage(hs: 4, ss: 0, fs: 48, ls: 0),
    MatterCodex[MatterCodes.Ed448N]!: Sizage(hs: 4, ss: 0, fs: 80, ls: 0),
    MatterCodex[MatterCodes.Ed448]!: Sizage(hs: 4, ss: 0, fs: 80, ls: 0),
    MatterCodex[MatterCodes.Ed448_Sig]!: Sizage(hs: 4, ss: 0, fs: 56, ls: 0),
    MatterCodex[MatterCodes.Tag]!: Sizage(hs: 4, ss: 0, fs: 8, ls: 0),
    MatterCodex[MatterCodes.DateTime]!: Sizage(hs: 4, ss: 0, fs: 36, ls: 0),
    MatterCodex[MatterCodes.X25519_Cipher_Salt]!: Sizage(hs: 4, ss: 0, fs: 100, ls: 0),
    MatterCodex[MatterCodes.TBD1]!: Sizage(hs: 4, ss: 0, fs: 8, ls: 1),
    MatterCodex[MatterCodes.TBD2]!: Sizage(hs: 4, ss: 0, fs: 8, ls: 2),
    MatterCodex[MatterCodes.StrB64_L0]!: Sizage(hs: 2, ss: 2, fs: nil, ls: 0),
    MatterCodex[MatterCodes.StrB64_L1]!: Sizage(hs: 2, ss: 2, fs: nil, ls: 1),
    MatterCodex[MatterCodes.StrB64_L2]!: Sizage(hs: 2, ss: 2, fs: nil, ls: 2),
    MatterCodex[MatterCodes.Str_L0]!: Sizage(hs: 2, ss: 2, fs: nil, ls: 0),
    MatterCodex[MatterCodes.Str_L1]!: Sizage(hs: 2, ss: 2, fs: nil, ls: 1),
    MatterCodex[MatterCodes.Str_L2]!: Sizage(hs: 2, ss: 2, fs: nil, ls: 2),
    MatterCodex[MatterCodes.StrB64_Big_L0]!: Sizage(hs: 4, ss: 4, fs: nil, ls: 0),
    MatterCodex[MatterCodes.StrB64_Big_L1]!: Sizage(hs: 4, ss: 4, fs: nil, ls: 1),
    MatterCodex[MatterCodes.StrB64_Big_L2]!: Sizage(hs: 4, ss: 4, fs: nil, ls: 2),
    MatterCodex[MatterCodes.Str_Big_L0]!: Sizage(hs: 4, ss: 4, fs: nil, ls: 0),
    MatterCodex[MatterCodes.Str_Big_L1]!: Sizage(hs: 4, ss: 4, fs: nil, ls: 1),
    MatterCodex[MatterCodes.Str_Big_L2]!: Sizage(hs: 4, ss: 4, fs: nil, ls: 2),
]
