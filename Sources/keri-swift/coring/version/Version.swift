//
// Created by Kevin Griffin on 2/14/22.
//

import Foundation

// hex characters in raw serialization size in version string
let verRawSize = 6

// Version format
let verFmt = "%@%x%x%@%@_"

// number of characters in full versions string
let verFullSize = 17
// {"v":"KERI10JSON00011c_"}
let minSniffSize = 25

typealias Versionage = (major: Int, minor: Int)

// KERI Protocol Version
let version = Versionage(major: 1, minor: 0)

/// Versify
///
/// - Parameters:
///   - ident: event type identifier one of Idents
///   - version: version tuple of type Versionage
///   - kind: serialization kind, one of Serials
///   - size: int of raw size
/// - Returns: version string
func versify(ident: Ident = .keri, version: Versionage = version, kind: Serial = .json, size: Int = 0) -> String {
    var vize = String(size, radix: 16)
    if vize.count < 6 {
        vize = String(repeatElement("0", count: 6 - vize.count)) + vize
    }

    return String(format: verFmt, ident.rawValue, version.major, version.minor, kind.rawValue, vize)
}

let verex = #"(?<ident>[A-Z]{4})(?<major>[0-9a-f])(?<minor>[0-9a-f])(?<kind>[A-Z]{4})(?<size>[0-9a-f]{6})_"#
// swiftlint:disable force_try
let rever = try! NSRegularExpression(pattern: verex, options: [])
let groups = ["ident", "major", "minor", "kind", "size"]

typealias Deversified = (ident: Ident, kind: Serial, version: Versionage, size: Int)
/// Deversify
/// - Parameter vs: version string
/// - Returns: Deversified(ident, kind, version, size)
///     - ident is event type identifier one of Idents
///     - kind is serialization kind, one of Serials
///     - version is version tuple of type Version
///     - size is int of raw size
/// - Throws: VersionErrors.invalidVersion
func deversify(vs: String) throws -> Deversified {
    let rng = NSRange(vs.startIndex ..< vs.endIndex, in: vs)
    var captures: [String: String] = [:]

    rever.enumerateMatches(in: vs, options: [], range: rng) { match, _, _ in
        guard let match = match else {
            return
        }

        for group in groups {
            if let sub = Range(match.range(withName: group), in: vs) {
                captures[group] = String(vs[sub])
            }
        }
    }

    if captures.count != 5 {
        throw VersionErrors.invalidVersion
    }

    guard let ident = Ident(rawValue: captures["ident"]!),
          let kind = Serial(rawValue: captures["kind"]!),
          let major = Int(captures["major"]!),
          let minor = Int(captures["minor"]!),
          let size = Int(captures["size"]!, radix: 16)
    else {
        throw VersionErrors.invalidVersion
    }

    return (ident: ident, kind: kind, version: Versionage(major: major, minor: minor), size: size)
}
