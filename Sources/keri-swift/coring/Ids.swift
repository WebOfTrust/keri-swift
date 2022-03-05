//
// Created by Kevin Griffin on 2/16/22.
//

import Foundation

public enum Id: String {
    case dollar = "$id"
    case at = "@id"
    case id
    case i
    case d
}

public let ids: Set<Id> = [.dollar, .at, .id, .i, .d]
