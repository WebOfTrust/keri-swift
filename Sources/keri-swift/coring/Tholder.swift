//
// Created by Kevin Griffin on 3/8/22.
//

import Foundation
import NumberKit

/// Tholder is KERI Signing Threshold Satisfaction
/// .satisfy method evaluates satisfaction based on ordered list of indices of
/// verified signatures where indices correspond to offsets in key list of
/// associated signatures.
struct Tholder {
    private var thold: Int = 0
    private var weighted: Bool = false

    init(sith: Int? = 0, limen: [Rational<Int>]? = []) throws {
        if sith! == 0, limen!.isEmpty {
            throw TholderErrors.invalid
        }

        if !limen!.isEmpty {
            self.weighted = true
            self.thold = 0
        } else {
            self.weighted = false
            self.thold = sith!
        }
    }

    func satisfy(indices: Int = 0) -> Bool {
        true
    }

    func satisyNumeric(indices: Int = 0) -> Bool {
        self.thold > 0 && indices >= self.thold
    }

    func satisyWeighted(indices: Int = 0) -> Bool {
        true
    }
}
