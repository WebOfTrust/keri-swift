//
// Created by Kevin Griffin on 2/17/22.
//

import Collections
import Foundation

struct Saider: Saidify {
    var sad: OrderedDictionary<String, Any>
    var m: Matter?

    init() {
        self.sad = [:]
    }
}
