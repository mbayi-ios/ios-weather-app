//
//  WeatherResponse.swift
//  IOSWeatherApp
//
//  Created by Amby on 24/06/2022.
//

import Foundation

struct WeatherResponse: Codable {
    var current: Weather
    var hourly: [Weather]
    var daily: [WeatherDaily]

    static func empty() -> WeatherResponse {
        return WeatherResponse(
            current: Weather(),
            hourly: [Weather](repeating: Weather(), count: 24),
            daily: [WeatherDaily](repeating: WeatherDaily(), count: 8))
    }
}
