//
//  WeatherDaily.swift
//  IOSWeatherApp
//
//  Created by Amby on 24/06/2022.
//

import Foundation


struct WeatherDaily: Codable, Identifiable {
    var dt: Int
    var temp: Temperature
    var weather: [WeatherDetail]

    enum CodingKey: String {
        case dt, temp, weather

    }

    init() {
        dt = 0
        temp = Temperature(min: 0.0, max: 0.0)
        weather = [WeatherDetail(main: "", description: "", icon: "")]
    }

}

extension WeatherDaily {
    var id: UUID {
        return UUID()
    }
}
