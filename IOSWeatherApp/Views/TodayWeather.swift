//
//  TodayWeather.swift
//  IOSWeatherApp
//
//  Created by Amby on 24/06/2022.
//

import SwiftUI

struct TodayWeather: View {
    @ObservedObject var cityViewModel: CityViewModel

    var body: some View {
        VStack {
            Text("Today")
                .font(.system(size: 20, weight: .medium))
            HStack {
                VStack{
                    Text("\(cityViewModel.temperature)°")
                        .font(.system(size: 60, weight: .medium))
                        .padding(.top, 15)
                    Text(cityViewModel.conditions)
                        .font(.system(size: 30, weight: .semibold))
                    Text(cityViewModel.getWeatherIconFor(icon: cityViewModel.weatherIcon))
                }
            }
        }


    }
}

struct TodayWeather_Previews: PreviewProvider {
    static var previews: some View {
        TodayWeather(cityViewModel: CityViewModel())
    }
}
