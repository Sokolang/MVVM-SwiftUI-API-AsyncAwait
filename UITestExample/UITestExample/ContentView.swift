//
//  ContentView.swift
//  UITestExample
//
//  Created by Anzhelika Sokolova on 23.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    @State private var alertText = ""
    @State private var textFieldValue: String = "Text from field"
    @State private var slider: Double = 30
    @State private var segmented = "ONE"
    
    var body: some View {
        VStack {
            Text(segmented.description)
                .font(.largeTitle)
            Spacer()
            TextField("TextField", text: $textFieldValue)
                .padding()
                .background(.yellow)
            Text(textFieldValue)
                .accessibilityIdentifier("label")
                .padding(.vertical, 20)
            Slider(value: $slider, in: 0...100)
                .padding(.vertical, 20)
                .accessibilityIdentifier("Slider")
            ProgressView("Completion", value: 100-slider, total: 100)
                .accessibilityIdentifier("Completion")
                .accentColor(Color.green)
                .padding(.vertical, 20)
            Picker("Segmented", selection: $segmented) {
                Text("ONE").tag("ONE")
                Text("TWO").tag("TWO")
            }
            .pickerStyle(.segmented)
            .padding(.vertical, 20)
            HStack {
                Button ("BLUE"){
                    alertText = "BLUE"
                    showingAlert = true
                }
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(width: 110, height: 50)
                    .background(.blue)
                Spacer()
                Button ("PURPLE") {
                    alertText = "PURPLE"
                    showingAlert = true
                }
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(width: 110, height: 50)
                    .background(.purple)
                    .padding(.horizontal, 5)
                Spacer()
                Button ("GREEN") {
                    alertText = "GREEN"
                    showingAlert = true
                }
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(width: 110, height: 50)
                    .background(.green)
            }
            .padding(.vertical, 10)
            Spacer()
        }
        .padding()
        .alert(alertText, isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
