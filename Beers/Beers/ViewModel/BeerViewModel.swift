//
//  BeerViewModel.swift
//  Beers
//
//  Created by Anzhelika Sokolova on 21.01.2023.
//

import Foundation

class BeerViewModel: ObservableObject {
    
    @Published var beer: [Beer] = []
    
    @MainActor
    func loadData() async throws {
        
        guard let url = URL(string: "https://api.punkapi.com/v2/beers") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedBeerResponse = try? JSONDecoder().decode([Beer].self, from: data) {
                beer = decodedBeerResponse
            }
        } catch {
            print("Invalid data")
        }
    }
}
