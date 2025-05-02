//
//  Networking.swift
//  RockApp
//
//  Created by Pradeep Dahiya on 02/05/2025.
//

import Foundation

class TrackService {
    func fetchTracks() async throws -> [Track] {
        guard let url = URL(string: "https://itunes.apple.com/search?term=rock") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(SearchResponse.self, from: data)
        return response.results
    }
}
