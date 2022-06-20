//
//  ViewModel.swift
//  WeatherLite
//
//  Created by Anzhellika Sokolova on 20.06.2022.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var title: String = "-"
    @Published var descriptionText: String = "-"
    @Published var temp: String = "-"
    @Published var timezone: String = "-"

    init() {
        fetchWeather()
    }
    
    func fetchWeather() {
        guard let url = URL(string:
                                "https://api.openweathermap.org/data/2.5/onecall?exclude=hourly,dayly,minutely&lat=54.7128&lon=20.51&units=metric&appid=0bac859f3ecda3d36fe46a01854431b8") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data,_, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.title = model.current.weather.first?.main ?? "No Title"
                    self.descriptionText = model.current.weather.first?.description ?? "No Description"
                    self.temp = "\(Int(model.current.temp))°"
                    self.timezone = model.timezone
                }
            }
            catch {
                print("failed")
            }
        }
        task.resume()
    }
    
}
