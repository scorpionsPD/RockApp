//
//  Models.swift
//  RockApp
//
//  Created by Pradeep Dahiya on 02/05/2025.
//

import Foundation

struct Track: Codable, Identifiable {
    let id = UUID()
    let trackName: String
    let artistName: String
    let trackPrice: Double?
    let artworkUrl100: String
    let trackTimeMillis: Int?
    let releaseDate: String
    let trackViewUrl: String
    
    enum CodingKeys: String, CodingKey {
        case trackName, artistName, trackPrice, artworkUrl100, trackTimeMillis, releaseDate, trackViewUrl
    }
}

struct SearchResponse: Codable {
    let results: [Track]
}
