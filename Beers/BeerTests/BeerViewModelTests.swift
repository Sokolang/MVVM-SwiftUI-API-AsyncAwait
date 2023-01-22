//
//  BeerViewModelTests.swift
//  BeerTests
//
//  Created by Anzhelika Sokolova on 22.01.2023.
//

import XCTest

@testable import Beers

class BeerViewModelTests: XCTestCase {
        
    func testLoadDataAsync() async throws {
        let url = URL(string: "https://api.punkapi.com/v2/beers")!
        // Use an asynchronous function to download the webpage.
        let dataAndResponse: (data: Data, response: URLResponse) = try await URLSession.shared.data(from: url, delegate: nil)
        XCTAssertTrue(dataAndResponse.data.isEmpty == false, "Failed to load data.")
    }
}
