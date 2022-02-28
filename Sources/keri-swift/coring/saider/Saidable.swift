//
// Created by Kevin Griffin on 2/28/22.
//

import Foundation

protocol Saidable: Dumpable {
    mutating func setId(v: String)
    mutating func preHash()
}

extension Saidable {
    mutating func preHash() {}
}
