//
// Created by Kevin Griffin on 2/4/22.
//

import Foundation

public let MatterCodex = [
    MatterCodes.Ed25519_Seed: "A", //  Ed25519 256 bit random seed for private key
    MatterCodes.Ed25519N: "B", //  Ed25519 verification key non-transferable, basic derivation.
    MatterCodes.X25519: "C", //  X25519 public encryption key, converted from Ed25519.
    MatterCodes.Ed25519: "D", //  Ed25519 verification key basic derivation
    MatterCodes.Blake3_256: "E", //  Blake3 256 bit digest self-addressing derivation.
    MatterCodes.Blake2b_256: "F", //  Blake2b 256 bit digest self-addressing derivation.
    MatterCodes.Blake2s_256: "G", //  Blake2s 256 bit digest self-addressing derivation.
    MatterCodes.SHA3_256: "H", //  SHA3 256 bit digest self-addressing derivation.
    MatterCodes.SHA2_256: "I", //  SHA2 256 bit digest self-addressing derivation.
    MatterCodes.ECDSA_256k1_Seed: "J", //  ECDSA secp256k1 448 bit random Seed for private key
    MatterCodes.Ed448_Seed: "K", //  Ed448 448 bit random Seed for private key
    MatterCodes.X448: "L", //  X448 public encryption key, converted from Ed448
    MatterCodes.Short: "M", // Short 2 byte b2 number or 3 char b64 str
    MatterCodes.Big: "N", // Big 8 byte b2 number or 11 char b64 str
    MatterCodes.X25519_Private: "O", // X25519 private decryption key converted from Ed25519
    MatterCodes.X25519_Cipher_Seed: "P", // X25519 124 char b64 Cipher of 44 char qb64 Seed
    MatterCodes.Salt_128: "0A", // 128 bit random seed.
    MatterCodes.Ed25519_Sig: "0B", // Ed25519 signature.
    MatterCodes.ECDSA_256k1_Sig: "0C", // ECDSA secp256k1 signature.
    MatterCodes.Blake3_512: "0D", // Blake3 512 bit digest self-addressing derivation.
    MatterCodes.Blake2b_512: "0E", // Blake2b 512 bit digest self-addressing derivation.
    MatterCodes.SHA3_512: "0F", // SHA3 512 bit digest self-addressing derivation.
    MatterCodes.SHA2_512: "0G", // SHA2 512 bit digest self-addressing derivation.
    MatterCodes.Long: "0H", // Long 4 byte b2 number or 6 char b54 str
    MatterCodes.ECDSA_256k1N: "1AAA", // ECDSA secp256k1 verification key non-transferable, basic derivation.
    MatterCodes.ECDSA_256k1: "1AAB", // Ed25519 public verification or encryption key, basic derivation
    MatterCodes.Ed448N: "1AAC", // Ed448 non-transferable prefix public signing verification key. Basic derivation.
    MatterCodes.Ed448: "1AAD", // Ed448 public signing verification key. Basic derivation.
    MatterCodes.Ed448_Sig: "1AAE", // Ed448 signature. Self-signing derivation.
    MatterCodes.Tag: "1AAF", // Base64 4 char tag or 3 byte number.
    MatterCodes.DateTime: "1AAG", // Base64 custom encoded 32 char ISO-8601 DateTime
    MatterCodes.X25519_Cipher_Salt: "1AAH", // X25519 100 char b64 Cipher of 24 char qb64 Salt
    MatterCodes.TBD1: "2AAA", // Testing purposes only of 1 lead size
    MatterCodes.TBD2: "3AAA", // Testing purposes only of 2 lead size
    MatterCodes.StrB64_L0: "4A", // String Base64 Only Leader Size 0
    MatterCodes.StrB64_L1: "5A", // String Base64 Only Leader Size 1
    MatterCodes.StrB64_L2: "6A", // String Base64 Only Leader Size 2
    MatterCodes.Str_L0: "4B", // String Leader Size 0
    MatterCodes.Str_L1: "5B", // String Leader Size 1
    MatterCodes.Str_L2: "6B", // String Leader Size 2
    MatterCodes.StrB64_Big_L0: "7AAA", // String Base64 Only Big Leader Size 0
    MatterCodes.StrB64_Big_L1: "8AAA", // String Base64 Only Big Leader Size 1
    MatterCodes.StrB64_Big_L2: "9AAA", // String Base64 Only Big Leader Size 2
    MatterCodes.Str_Big_L0: "7AAB", // String Big Leader Size 0
    MatterCodes.Str_Big_L1: "8AAB", // String Big Leader Size 1
    MatterCodes.Str_Big_L2: "9AAB", // String Big Leader Size 2
]