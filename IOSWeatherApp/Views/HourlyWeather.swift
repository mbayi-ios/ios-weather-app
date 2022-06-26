//
//  HourlyWeather.swift
//  IOSWeatherApp
//
//  Created by Amby on 24/06/2022.
//

import SwiftUI

struct HourlyWeather: View {
    @ObservedObject var cityViewModel: CityViewModel

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(cityViewModel.weather.hourly){ weather in
                    let hour = cityViewModel.getTimeFor(timestamp: weather.dt)
                    let temp = cityViewModel.getTempFor(temp: weather.temp)
                    getHourlyView(hour: hour, temp: temp)
                }
            }
        }
    }

    private func getHourlyView(hour: String, temp: String) -> some View {
        VStack {
            Text(hour)
            Text("\(temp) ℃")
        }
    }
}

struct HourlyWeather_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeather(cityViewModel: CityViewModel())
    }
}
