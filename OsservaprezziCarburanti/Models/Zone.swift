//
//  Zone.swift
//  OsservaprezziCarburanti
//
//  Created by Alex Sandri on 28/09/23.
//

import Foundation

struct Zone: Codable {
    let success: Bool
    let center: Location
    let results: [Station]

    static func list(location: Location) async throws -> Zone {
        let url = "https://carburanti.mise.gov.it/ospzApi/search/zone"

        let body: [String: Any?] = [
            "points": [
                [
                    "lat": location.lat,
                    "lng": location.lng
                ]
            ],
            "radius": 5
        ]

        let parser = JsonParser<Zone>()

        return try await parser.load("POST", url, body: body)
    }
}
