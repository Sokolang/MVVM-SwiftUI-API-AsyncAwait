//
//  ContentView.swift
//  Beers
//
//  Created by Anzhelika Sokolova on 21.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var beer = BeerViewModel()

    var body: some View {
        NavigationView {
            List(beer.beer, id: \.id) { item in
                NavigationLink {
                    VStack {
                        AsyncImage(url: URL(string: item.image_url))
                        { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 200, height: 200)
                        Text(item.name)
                            .font(.largeTitle)
                        Text(item.tagline)
                        Spacer()
                    }
                    .padding()
                } label: {
                    HStack {
                        AsyncImage(url: URL(string: item.image_url))
                        { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 70, height: 70)
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.tagline)
                        }
                        Spacer()
                    }
                }
            }
            .accessibilityIdentifier("beerList")
            .navigationTitle("Beer")
        }
        .task {
            try? await beer.loadData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
