//
// Created by Kevin Griffin on 2/15/22.
//

import Foundation

public enum SerderErrors: Error {
    case improperInitialization
    case insufficientBytes
    case invalidDeserializationKind(Serial)
    case notImplemented(Serial)
    case failedKedExtraction
    case invalidIdent
    case invalidSerializationKind(Serial)
    case exhaleKindMismatch
    case failedVersionSubstitution
}
