//
//  TrackDetailView.swift
//  RockApp
//
//  Created by Pradeep Dahiya on 02/05/2025.
//

import Foundation
import SwiftUI

struct TrackDetailView: View {
    @StateObject private var viewModel: TrackDetailViewModel

    init(track: Track) {
        _viewModel = StateObject(wrappedValue: TrackDetailViewModel(track: track))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: viewModel.track.artworkUrl100)) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    Color.gray
                }
                .frame(maxWidth: .infinity)
                .cornerRadius(12)

                Text(viewModel.track.trackName)
                    .font(.title)
                    .bold()

                Text("Artist: \(viewModel.track.artistName)")
                    .font(.headline)

                Text("Price: $\(viewModel.track.trackPrice ?? 0, specifier: "%.2f")")
                    .font(.subheadline)

                Text("Duration: \(viewModel.formattedDuration)")
                    .font(.subheadline)

                Text("Release Date: \(viewModel.formattedReleaseDate)")
                    .font(.subheadline)

                Button("More Details") {
                    if let url = URL(string: viewModel.track.trackViewUrl) {
                        UIApplication.shared.open(url)
                    }
                }
                .buttonStyle(.borderedProminent)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Track Details")
    }
}
