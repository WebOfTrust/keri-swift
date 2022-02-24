//
// Created by Kevin Griffin on 2/22/22.
//

import Foundation

extension ISO8601DateFormatter {
    convenience init(_ formatOptions: Options) {
        self.init()
        self.formatOptions = formatOptions
    }
}

extension Formatter {
    static let iso8601WithFractionalSeconds = ISO8601DateFormatter([
        .withInternetDateTime,
        .withFractionalSeconds,
        .withTimeZone,
        .withColonSeparatorInTimeZone,
    ])
}

extension Date {
    var iso8601WithFractionalSeconds: String { Formatter.iso8601WithFractionalSeconds.string(from: self) }
}

extension String {
    var iso8601WithFractionalSeconds: Date? { Formatter.iso8601WithFractionalSeconds.date(from: self) }
}
