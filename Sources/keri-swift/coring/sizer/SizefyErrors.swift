//
// Created by Kevin Griffin on 2/15/22.
//

import Foundation

enum SizeifyErrors: Error, Equatable {
    case missingVersion
    case invalidVersion
    case mismatchedSerialization
}
