//
//  Constants.swift
//  RockApp
//
//  Created by Pradeep Dahiya on 04/05/2025.
//

import Foundation

enum Strings {
    enum Titles {
        static let rockTracks = "Rock Tracks"
        static let trackDetails = "Track Details"
        static let loading = "Loading tracks..."
        static let retry = "Retry"
        static let moreDetails = "More Details"
    }

    enum Errors {
        static let unknown = "An unexpected error occurred"
        static let noValue = "N/A"
    }

    enum Format {
        static let price = "$%.2f"
        static let duration = "%dm %ds"
    }

    enum Labels {
        static let artist = "Artist: "
        static let price = "Price: "
        static let duration = "Duration: "
        static let releaseDate = "Release Date: "
    }
}
