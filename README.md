# ScottishPower iOS Tech Test

## Overview

This is a Universal iOS app built in **Swift + SwiftUI** that connects to the iTunes API to display a list of rock tracks.  
It demonstrates MVVM pattern, modern SwiftUI best practices, error handling, and unit testing.

---

## Features

- Display list of rock tracks with:
  - Artwork
  - Track Name
  - Artist Name
  - Price
- Tap a track to view detailed info:
  - Artwork
  - Track Name
  - Artist
  - Price
  - Duration
  - Release Date
  - "More Details" button (opens track in Safari)
    
- Sorted by release date
- Async image loading
- Caching images for better performance on slow networks
- Error handling
- MVVM
- Unit tests

---

## Technical Details

- Language: Swift
- UI Framework: SwiftUI
- Architecture: MVVM
- Async/Await + URLSession for networking
- No third-party libraries
- iOS 15 minimum support

---

## 📡 API

iTunes Search API:  
`https://itunes.apple.com/search?term=rock`

---

## 🧪 Tests

Unit tests included for:
- JSON decoding (`TrackModelTests`)
- Networking service using mock data (`TrackServiceTests`)

---

## 📌 Future Improvements

- Pull to refresh on track list
- Enhanced accessibility
- Offline mode (using Core Data or local caching)
- UI animations and polishing
