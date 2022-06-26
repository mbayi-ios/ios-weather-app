//
//  ContentView.swift
//  IOSWeatherApp
//
//  Created by Amby on 24/06/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cityViewModel = CityViewModel()

    var body: some View {
        ZStack {
            City(cityViewModel: cityViewModel)
            VStack{
            MenuHeader(cityViewModel: cityViewModel)
            }
            .offset(y: 350)
            .padding([.bottom, .leading, .trailing], 40)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
