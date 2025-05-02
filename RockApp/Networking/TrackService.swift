//
//  Networking.swift
//  RockApp
//
//  Created by Pradeep Dahiya on 02/05/2025.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case badURL
    case badResponse
    case decodingError
    case unknown

    var errorDescription: String? {
        switch self {
        case .badURL:
            return "Invalid URL."
        case .badResponse:
            return "Server returned a bad response."
        case .decodingError:
            return "Failed to decode data."
        case .unknown:
            return "An unknown error occurred."
        }
    }
}

class TrackService {
    func fetchTracks() async throws -> [Track] {
        guard let url = URL(string: "https://itunes.apple.com/search?term=rock") else {
            throw NetworkError.badURL
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.badResponse
            }

            let decodedResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
            return decodedResponse.results
        } catch is DecodingError {
            throw NetworkError.decodingError
        } catch {
            throw NetworkError.unknown
        }
    }
}
