//
//  City.swift
//  IOSWeatherApp
//
//  Created by Amby on 24/06/2022.
//

import SwiftUI

struct City: View {
    @ObservedObject var cityViewModel: CityViewModel
    
    var body: some View {
        ZStack {
            if (cityViewModel.conditions == "Clouds") {
                Color("CloudyColor")
                    .ignoresSafeArea()
                Image("forest_cloudy")
                    .resizable()
                    .ignoresSafeArea(edges: .top)
                    .frame(width: 430, height: 430)
                    .offset(y: -270)

            } else if  (cityViewModel.conditions == "Clear"){
                Color("SunnyColor")
                    .ignoresSafeArea()
                Image("forest_sunny")
                    .resizable()
                    .ignoresSafeArea(edges: .top)
                    .frame(width: 430, height: 430)
                    .offset(y: -270)

            } else if  (cityViewModel.conditions == "Rain"){
                Color("RainyColor")
                    .ignoresSafeArea()
                Image("forest_rainy")
                    .resizable()
                    .ignoresSafeArea(edges: .top)
                    .frame(width: 430, height: 430)
                    .offset(y: -270)
            }


            VStack {
                TodayWeather(cityViewModel: cityViewModel)
                CityNameView(city: cityViewModel.city, date: cityViewModel.date)
                //HourlyWeather(cityViewModel: cityViewModel)
                Spacer()
                DailyWeather(cityViewModel: cityViewModel)
                Spacer()
            }
        }
        .foregroundColor(Color.white)
    }
}

struct City_Previews: PreviewProvider {
    static var previews: some View {
        City(cityViewModel: CityViewModel())
    }
}
