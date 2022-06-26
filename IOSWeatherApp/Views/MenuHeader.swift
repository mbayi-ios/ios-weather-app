//
//  MenuHeader.swift
//  IOSWeatherApp
//
//  Created by Amby on 24/06/2022.
//

import SwiftUI

struct MenuHeader: View {

    @ObservedObject var cityViewModel: CityViewModel

    @State private var searchTerm: String = ""
    @FocusState  private var isSearchTermFocused: Bool

    var body: some View {
        ZStack(alignment: .topLeading) {
        HStack {
            TextField("",  text: $searchTerm)
                .focused($isSearchTermFocused)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)

            Button {
                cityViewModel.city = searchTerm

            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 7)
                        .fill(Color.gray)
                    Image(systemName: "location.fill")
                }
            }
            .frame(width: 30, height: 30)
        }
        }
        .foregroundColor(.white)
        .padding()
        .background(
            ZStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8)

                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.5))
            }
        )
    }
}

struct MenuHeader_Previews: PreviewProvider {
    static var previews: some View {
        MenuHeader(cityViewModel: CityViewModel())
        
    }
}
