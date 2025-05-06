//
//  TrackListView.swift
//  RockApp
//
//  Created by Pradeep Dahiya on 02/05/2025.
//

import Foundation
import SwiftUI

struct TrackListView: View {
    @StateObject private var viewModel = TrackListViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView(Strings.Titles.loading)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let error = viewModel.errorMessage {
                    VStack(spacing: 16) {
                        Text(error)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding()

                        Button(Strings.Titles.retry) {
                            Task {
                                await viewModel.loadTracks()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List(viewModel.tracks) { track in
                        NavigationLink(destination: TrackDetailView(track: track)) {
                            TrackRowView(track: track)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle(Strings.Titles.rockTracks)
            .task {
                await viewModel.loadTracks()
            }
        }
    }
}

private struct TrackRowView: View {
    let track: Track

    var body: some View {
        HStack {
            CachedAsyncImage(url: URL(string: track.artworkUrl100))
                .frame(width: 60, height: 60)
                .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(track.trackName)
                    .font(.headline)
                Text(track.artistName)
                    .font(.subheadline)
                Text(String(format: Strings.Format.price, track.trackPrice ?? 0))
                    .font(.caption)
            }
        }
    }
}
