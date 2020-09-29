//
//  Decoder.swift
//  Adesys Alarm
//
//  Created by Ishak Guclu on 24/09/2019.
//  Copyright © 2019 Adesys. All rights reserved.
//

import Foundation
class AdesysDecoder: JSONDecoder {
    override init() {
        super.init()
        dateDecodingStrategy = .customISO8601
    }
}

extension JSONDecoder.DateDecodingStrategy {
    static let customISO8601 = custom {
        let container = try $0.singleValueContainer()
        let string = try container.decode(String.self)
        if let date = Formatter.iso8601.date(from: string) ?? Formatter.iso8601noFS.date(from: string) {
            return date
        }
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: \(string)")
    }
}

extension Formatter {
    static let iso8601: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()
    static let iso8601noFS = ISO8601DateFormatter()
}
