//
// Created by Kevin Griffin on 2/10/22.
//

import Collections
import Foundation

enum ConversionErrors: Error, Equatable {
    case undefined
    case characterNotFound(Character)
}

/// Returns conversion of Base64 str s or bytes to int
func b64ToInt(s: String) throws -> Int {
    if s.isEmpty {
        throw ConversionErrors.undefined
    }

    var i = 0
    for (e, c) in s.reversed().enumerated() {
        guard let ch = b64IdxByChr[String(c)] else {
            throw ConversionErrors.characterNotFound(c)
        }
        i |= ch << (e * 6)
    }

    return i
}

/// Returns conversion of int i to Base64 str
/// l is min number of b64 digits left padded with Base64 0 == "A" char
func intToB64(i: Int, l: Int? = 1) -> String {
    var d: Deque<String> = []
    var _i = i, _l = l!

    if _l == 0 {
        return ""
    }

    repeat {
        d.prepend(b64ChrByIdx[_i % 64]!)
        _i = Int(floor(Double(_i / 64)))
    } while _i != 0

    for _ in 0 ..< max(_l - d.count, 0) {
        d.prepend("A")
    }

    return d.joined(separator: "")
}

let b64ChrByIdx: [Int: String] = {
    var _B64ChrIdx: [Int: String] = [:]
    var x = 0

    let f = { (i: Int, _B64ChrIdx: inout [Int: String], x: inout Int) in
        _B64ChrIdx[x] = String(Character(UnicodeScalar(i)!))
        x += 1
    }

    (65 ... 90).forEach {
        f($0, &_B64ChrIdx, &x)
    }
    (97 ... 122).forEach {
        f($0, &_B64ChrIdx, &x)
    }
    (48 ... 57).forEach {
        f($0, &_B64ChrIdx, &x)
    }
    _B64ChrIdx[62] = "-"
    _B64ChrIdx[63] = "_"

    return _B64ChrIdx
}()

let b64IdxByChr: [String: Int] = {
    var _B64IdxByChr: [String: Int] = [:]

    for (k, v) in b64ChrByIdx {
        _B64IdxByChr[v] = k
    }

    return _B64IdxByChr
}()
