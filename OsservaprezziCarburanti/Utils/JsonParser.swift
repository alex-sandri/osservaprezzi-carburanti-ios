//
//  JsonParser.swift
//  OsservaprezziCarburanti
//
//  Created by Alex Sandri on 28/09/23.
//

import Foundation
import os

enum JsonParserError: Error {
    case invalidUrl
    case malformedObject
    case missingAuth
}

struct JsonParser<T: Decodable> {
    private var logger = Logger.initFor(JsonParser.self)

    func load(
        _ httpMethod: String,
        _ urlString: String,
        body: [String: Any?]? = nil
    ) async throws -> T {
        logger.info("\(httpMethod) \(urlString)")

        guard let url = URL(string: urlString) else {
            throw JsonParserError.invalidUrl
        }

        var request = URLRequest(url: url)

        request.httpMethod = httpMethod

        if httpMethod != "GET" {
            request.httpBody = try JSONSerialization.data(withJSONObject: body ?? [] as [Any])
        }

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let (data, _) = try await URLSession.shared.data(for: request)

        guard let object = parse(data) else {
            throw JsonParserError.malformedObject
        }

        return object
    }

    func parse(_ data: Data) -> T? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        var object: T? = nil

        do {
            object = try decoder.decode(T.self, from: data)
        } catch {
            print(error)
        }

        return object
    }
}
