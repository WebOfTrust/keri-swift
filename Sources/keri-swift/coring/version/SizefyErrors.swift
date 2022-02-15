//
// Created by Kevin Griffin on 2/15/22.
//

import Foundation

enum SizeifyErrors: Error, Comparable {
    case missingVersion
    case mismatchedSerialization(Serial, Serial)
    case invalidSerialization(Serial)
}
