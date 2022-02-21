//
// Created by Kevin Griffin on 2/14/22.
//

import Foundation

// hex characters in raw serialization size in version string
public let VerRawSize = 6

// Version format
public let VerFmt = "%@%x%x%@%@_"

// number of characters in full versions string
public let VerFullSize = 17
public let MinSniffSize = VerFullSize + 12

public typealias Versionage = (major: Int, minor: Int)

// KERI Protocol Version
public let Version = Versionage(major: 1, minor: 0)

/// Versify
///
/// - Parameters:
///   - ident: event type identifier one of Idents
///   - version: version tuple of type Versionage
///   - kind: serialization kind, one of Serials
///   - size: int of raw size
/// - Returns: version string
// swiftlint:disable line_length
public func versify(ident: Ident = .keri, version: Versionage = Version, kind: Serial = .json, size: Int = 0) -> String {
    String(format: VerFmt, ident.rawValue, version.major, version.minor, kind.rawValue,
           String(size, radix: 16).padding(toLength: 6, withPad: "0", startingAt: 0))
}

public let Verex = #"(?<ident>[A-Z]{4})(?<major>[0-9a-f])(?<minor>[0-9a-f])(?<kind>[A-Z]{4})(?<size>[0-9a-f]{6})_"#
// swiftlint:disable force_try
public let Rever = try! NSRegularExpression(pattern: Verex, options: [])
let Groups = ["ident", "major", "minor", "kind", "size"]

public typealias Deversified = (ident: Ident, kind: Serial, version: Versionage, size: Int)
/// Deversify
/// - Parameter vs: version string
/// - Returns: Deversified(ident, kind, version, size)
///     - ident is event type identifier one of Idents
///     - kind is serialization kind, one of Serials
///     - version is version tuple of type Version
///     - size is int of raw size
/// - Throws: VersionErrors.invalidVersion
public func deversify(vs: String) throws -> Deversified {
    let rng = NSRange(vs.startIndex ..< vs.endIndex, in: vs)
    var captures: [String: String] = [:]

    Rever.enumerateMatches(in: vs, options: [], range: rng) { match, _, _ in
        guard let match = match else {
            return
        }

        for group in Groups {
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
          let size = Int(captures["size"]!)
    else {
        throw VersionErrors.invalidVersion
    }

    return (ident: ident, kind: kind, version: Versionage(major: major, minor: minor), size: size)
}
