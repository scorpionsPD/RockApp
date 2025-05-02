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
                    ProgressView("Loading tracks...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let error = viewModel.errorMessage {
                    VStack(spacing: 16) {
                        Text(error)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding()

                        Button("Retry") {
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
            .navigationTitle("Rock Tracks")
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
            AsyncImage(url: URL(string: track.artworkUrl100)) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 60, height: 60)
            .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(track.trackName)
                    .font(.headline)
                Text(track.artistName)
                    .font(.subheadline)
                Text("$\(track.trackPrice ?? 0, specifier: "%.2f")")
                    .font(.caption)
            }
        }
    }
}
