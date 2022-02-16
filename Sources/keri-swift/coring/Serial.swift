//
// Created by Kevin Griffin on 2/14/22.
//

import Foundation

public enum Serial: String, Comparable {
    public static func < (lhs: Serial, rhs: Serial) -> Bool {
        lhs.rawValue == rhs.rawValue
    }

    case json = "JSON"
    case mgpk = "MGPK"
    case cbor = "CBOR"
}

public let Serials: Set<Serial> = [Serial.json, Serial.mgpk, Serial.cbor]
