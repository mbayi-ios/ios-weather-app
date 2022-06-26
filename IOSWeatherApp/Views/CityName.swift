//
//  CityName.swift
//  IOSWeatherApp
//
//  Created by Amby on 24/06/2022.
//

import SwiftUI

struct CityNameView: View {

    var city: String
    var date: String

    var body: some View {
        Text(city)
            .font(.system(size: 30, weight: .medium))
        Text(date)
    }
}

struct CityName_Previews: PreviewProvider {
    static var previews: some View {
        CityNameView(city: "nairobi", date: "12/12/2002")
    }
}
