//
//  CachedAsyncImage.swift
//  RockApp
//
//  Created by Pradeep Dahiya on 06/05/2025.
//

import Foundation
import SwiftUI

struct CachedAsyncImage: View {
    let url: URL?
    @State private var image: UIImage?

    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
            } else {
                Color.gray
                    .onAppear {
                        loadImage()
                    }
            }
        }
    }

    private func loadImage() {
        guard let url = url else { return }

        if let cached = ImageCache.shared.object(forKey: url.absoluteString as NSString) {
            self.image = cached
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let downloaded = UIImage(data: data) {
                ImageCache.shared.setObject(downloaded, forKey: url.absoluteString as NSString)

                DispatchQueue.main.async {
                    self.image = downloaded
                }
            }
        }.resume()
    }
}
