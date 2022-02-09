//
// Created by Kevin Griffin on 2/4/22.
//

import Foundation

public enum MatterCodes: String, CaseIterable {
    case Ed25519_Seed
    case Ed25519N
    case X25519
    case Ed25519
    case Blake3_256
    case Blake2b_256
    case Blake2s_256
    case SHA3_256
    case SHA2_256
    case ECDSA_256k1_Seed
    case Ed448_Seed
    case X448
    case Short
    case Big
    case X25519_Private
    case X25519_Cipher_Seed
    case Salt_128
    case Ed25519_Sig
    case ECDSA_256k1_Sig
    case Blake3_512
    case Blake2b_512
    case SHA3_512
    case SHA2_512
    case Long
    case ECDSA_256k1N
    case ECDSA_256k1
    case Ed448N
    case Ed448
    case Ed448_Sig
    case Tag
    case DateTime
    case X25519_Cipher_Salt
    case TBD1
    case TBD2
    case StrB64_L0
    case StrB64_L1
    case StrB64_L2
    case Str_L0
    case Str_L1
    case Str_L2
    case StrB64_Big_L0
    case StrB64_Big_L1
    case StrB64_Big_L2
    case Str_Big_L0
    case Str_Big_L1
    case Str_Big_L2
}
