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

                Text(Strings.Labels.artist + viewModel.track.artistName)
                    .font(.headline)

                Text(Strings.Labels.price + String(format: Strings.Format.price, viewModel.track.trackPrice ?? 0))
                    .font(.subheadline)

                Text(Strings.Labels.duration + viewModel.formattedDuration)
                    .font(.subheadline)

                Text(Strings.Labels.releaseDate + viewModel.formattedReleaseDate)
                    .font(.subheadline)

                Button(Strings.Titles.moreDetails) {
                    if let url = URL(string: viewModel.track.trackViewUrl) {
                        UIApplication.shared.open(url)
                    }
                }
                .buttonStyle(.borderedProminent)

                Spacer()
            }
            .padding()
        }
        .navigationTitle(Strings.Titles.trackDetails)
    }
}
