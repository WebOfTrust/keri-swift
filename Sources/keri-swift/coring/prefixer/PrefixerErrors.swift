//
// Created by Kevin Griffin on 3/7/22.
//

import Foundation

enum PrefixerErrors: Error, Equatable {
    case invalidIlk(Ilk)
    case invalidCode(String)
    case invalidEvent
}
