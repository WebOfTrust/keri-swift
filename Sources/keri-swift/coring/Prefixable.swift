//
// Created by Kevin Griffin on 3/7/22.
//

import Foundation

protocol Prefixbale: Ilkable, Dumpable {
    func keys() -> [String]
}
