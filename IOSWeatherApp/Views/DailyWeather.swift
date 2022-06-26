//
//  DailyWeather.swift
//  IOSWeatherApp
//
//  Created by Amby on 24/06/2022.
//

import SwiftUI

struct DailyWeather: View {
    @ObservedObject var cityViewModel: CityViewModel

    var body: some View {
        ForEach(cityViewModel.weather.daily) { weather in
            LazyVStack{
                dailyCell(weather: weather)
            }
        }
    }

    private func dailyCell(weather: WeatherDaily) -> some View {

            //Text("\(cityViewModel.getTempFor(temp: weather.temp.max)) | \(cityViewModel.getTempFor(temp: weather.temp.min))℃")

            HStack(spacing: 130) {
                Text(cityViewModel.getDayFor(timestamp: weather.dt))
                    .font(.headline)
                cityViewModel.getWeatherIconFor(icon: weather.weather[0].icon)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                Text("\(cityViewModel.getTempFor(temp: weather.temp.max))°")
                    .foregroundColor(.white)
                    .font(.headline)
            }

    }
}

struct DailyWeather_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeather(cityViewModel: CityViewModel())
    }
}
