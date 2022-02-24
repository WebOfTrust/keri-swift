//
// Created by Kevin Griffin on 2/22/22.
//

import Foundation

/// Registrar Seal
/// {
///  "d" : "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM",
///  "bi": "DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM"
/// }
struct RegistrarSeal: Codable {
    public var d: String
    public var bi: String

    public init(d: String, bi: String) {
        self.d = d
        self.bi = bi
    }

    enum CodingKeys: String, CodingKey {
        case d, bi
    }
}
