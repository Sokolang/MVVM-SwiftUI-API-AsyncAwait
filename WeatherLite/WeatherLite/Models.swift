//
//  Models.swift
//  WeatherLite
//
//  Created by Anzhellika Sokolova on 20.06.2022.
//

import Foundation

struct WeatherModel: Codable {
    let timezone: String
    let current: CurrentWeather
}

struct CurrentWeather: Codable {
    let temp: Float
    let weather: [WeatherInfo]
}

struct WeatherInfo: Codable {
    let main: String
    let description: String
}
