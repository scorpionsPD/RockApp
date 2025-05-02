//
//  TrackDetailViewModel.swift
//  RockApp
//
//  Created by Pradeep Dahiya on 02/05/2025.
//

import Foundation

class TrackDetailViewModel: ObservableObject {
    let track: Track

    init(track: Track) {
        self.track = track
    }

    var formattedDuration: String {
        guard let millis = track.trackTimeMillis else { return "N/A" }
        let seconds = millis / 1000
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return "\(minutes)m \(remainingSeconds)s"
    }

    var formattedReleaseDate: String {
        let isoFormatter = ISO8601DateFormatter()
        let displayFormatter = DateFormatter()
        displayFormatter.dateStyle = .medium
        
        if let date = isoFormatter.date(from: track.releaseDate) {
            return displayFormatter.string(from: date)
        }
        return "N/A"
    }
}
