//
//  CityViewModel.swift
//  IOSWeatherApp
//
//  Created by Amby on 24/06/2022.
//

import Foundation
import SwiftUI
import CoreLocation

final class CityViewModel: ObservableObject {
    @Published var weather = WeatherResponse.empty()
    @Published var city: String = "Nairobi" {
        didSet {
            getLocation()
        }
    }

    init() {
        getLocation()
    }

    //getting and formating dates
    var date: String{
        return dateFormatter.string(
            from: Date(timeIntervalSince1970: TimeInterval(weather.current.dt))
        )
    }

    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()

    //getting current temperature and formatting it
    var temperature: String {
        return getTempFor(temp: weather.current.temp)
    }

    func getTempFor(temp: Double) -> String {
        return String(format: "%0.1f", temp)
    }

    //get time and convert
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()


    func getTimeFor(timestamp: Int) -> String {
        return timeFormatter.string(
            from: Date(timeIntervalSince1970: TimeInterval(timestamp))
        )
    }
    //get day and convert
    private lazy var dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter

    }()
    func getDayFor(timestamp: Int) -> String {
        return dayFormatter.string(
            from: Date(timeIntervalSince1970: TimeInterval(timestamp))
        )
    }

    //getting conditions
    var conditions: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return ""
    }

    //get weather icon
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "a sky"
    }


    private func getLocation() {
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let places = placemarks, let place = places.first {
                self.getWeather(coord: place.location?.coordinate)
            }

        }
    }
    private func getWeather(coord: CLLocationCoordinate2D?) {
        if let coord = coord {
            let urlString = Api.getUrlFor(lat: coord.latitude, lon: coord.longitude)
            getWeatherInternal(city: city, for: urlString)
        } else {
            let urlString = Api.getUrlFor(lat: 10, lon: 10)
            getWeatherInternal(city: city, for: urlString)
        }
    }

    private func getWeatherInternal(city: String, for urlString: String) {
        NetworkManager<WeatherResponse>.fetch(for: URL(string: urlString)!) {(result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.weather = response
                }
            case .failure(let err):
                print(err)
            }
        }
    }

    func getWeatherIconFor(icon: String) -> Image {
        switch icon {
        case "01d":
            return Image(systemName: "sun.max.fill")

        case "01n":
            return Image(systemName: "moon.fill")

        case "02d":
            return Image(systemName: "cloud.sun.fill")

        case "02n":
            return Image(systemName: "cloud.moon.fill")

        case "03d":
            return Image(systemName: "cloud.fill")

        case "03n":
            return Image(systemName: "cloud.fill")

        case "04d":
            return Image(systemName: "cloud.fill")

        case "04n":
            return Image(systemName: "cloud.fill")

        case "09d":
            return Image(systemName: "cloud.drizzle.fill")

        case "09n":
            return Image(systemName: "cloud.drizzle.fill")

        case "10d":
            return Image(systemName: "cloud.heavyrain.fill")

        case "10n":
            return Image(systemName: "cloud.heavyrain.fill")

        case "11d":
            return Image(systemName: "cloud.bolt.fill")

        case "11n":
            return Image(systemName: "cloud.bolt.fill")

        case "13d":
            return Image(systemName: "cloud.snow.fill")

        case "13n":
            return Image(systemName: "cloud.snow.fill")

        case "50d":
            return Image(systemName: "cloud.fog.fill")

        case "50n":
            return Image(systemName: "cloud.fog.fill")
            
        default:
            return Image(systemName: "sun.max.fill")
        }
    }
}
