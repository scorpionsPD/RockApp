//
//  ViewModels.swift
//  RockApp
//
//  Created by Pradeep Dahiya on 02/05/2025.
//

import Foundation

@MainActor
class TrackListViewModel: ObservableObject {
    @Published var tracks: [Track] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service = TrackService()

    func loadTracks() async {
        isLoading = true
        do {
            let fetchedTracks = try await service.fetchTracks()
            tracks = fetchedTracks.sorted {
                ($0.releaseDate) > ($1.releaseDate)
            }
            errorMessage = nil
        } catch {
            errorMessage = (error as? LocalizedError)?.errorDescription ?? Strings.Errors.unknown
        }
        isLoading = false
    }
}

