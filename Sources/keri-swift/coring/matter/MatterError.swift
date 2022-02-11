//
// Created by Kevin Griffin on 2/4/22.
//

import Foundation

public enum MatterError: Error, Equatable {
    case invalidCode(code: String, pad: Int)
    case missingSizageForCode(code: String)
    case mismatchedRawSize(actual: Int, expected: Int)
    case invalidCodeForPad(code: String, pad: Int)
    case improperInitialization
    case invalidCodeSize
    case mismatchedPaddingCount(expected: Int, got: Int?)
    case invalidDerivationCode(code: String, in: String)
    case invalidSizeForCode(code: String, got: Int, expected: Int)
    case improperlyCodedMaterial(String)
}
