//
// Created by Kevin Griffin on 2/14/22.
//

import Foundation

enum VersionErrors: Error, Comparable {
    case invalidIdentifier
    case invalidSerialization
    case invalidVersion
}
