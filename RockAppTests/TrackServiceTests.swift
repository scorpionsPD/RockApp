//
//  TrackServiceTests.swift
//  RockAppTests
//
//  Created by Pradeep Dahiya on 02/05/2025.
//
import XCTest
@testable import RockApp

final class TrackServiceTests: XCTestCase {
    
    func testFetchTracksMock() throws {
        let json = """
        {
            "results": [
                {
                    "trackName": "I'm Yours",
                    "artistName": "Jason Mra",
                    "trackPrice": 1.29,
                    "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/f8/ac/ec/f8acec21-40e2-fa91-fe61-1be3cbc1467a/mzi.jokpbtnf.jpg/100x100bb.jpg",
                    "trackTimeMillis": 242947,
                    "releaseDate": "2008-02-12T08:00:00Z",
                    "trackViewUrl": "https://music.apple.com/us/album/im-yours/277635758?i=277635828&uo=4"
                }
            ]
        }
        """.data(using: .utf8)!
        
        let response = try JSONDecoder().decode(SearchResponse.self, from: json)
        
        XCTAssertEqual(response.results.count, 1)
        XCTAssertEqual(response.results.first?.trackName, "I'm Yours")
    }
}
