//
//  Weather.swift
//  IOSWeatherApp
//
//  Created by Amby on 24/06/2022.
//

import Foundation

struct Weather: Codable, Identifiable {
    var dt: Int
    var temp: Double
    var feels_like: Double
    var pressure: Int
    var humidity: Double
    var dew_point: Double
    var clouds: Int
    var wind_speed: Double
    var wind_deg: Int
    var weather: [WeatherDetail]

    enum CodingKey: String {
        case dt, temp, temp_max, feel_like, pressure, humidity, dew_point, clouds, wind_speed, wind_deg, weather
    }

    init() {
        dt = 0
        temp = 0
        feels_like = 0
        pressure = 0
        humidity = 0
        dew_point = 0.0
        clouds = 0
        wind_speed = 0
        wind_deg = 0
        weather = []
    }
}

extension Weather {
    var id: UUID {
        return UUID()
    }
}
