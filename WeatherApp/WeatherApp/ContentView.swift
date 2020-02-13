//
//  ContentView.swift
//  WeatherApp
//
//  Created by Tia Lallo on 31/01/2020.
//  Copyright © 2020 Tia Lallo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selected = 0
    @ObservedObject var weather = CurrentWeatherViewModel()
        @State var city: String = ""

    
    var body: some View {
        
        VStack {
            TextField("Search", text: $city) {
                self.weather.fetch(self.city)
            }.padding(.horizontal)
            
            Text("\(weather.current?.name ?? "unknown")")
                .font(.title)
                .bold()
                .padding(.horizontal)
        
            HStack(alignment: .center, spacing: 20) {
            GeometryReader{ gr in
                CurrentWeather(weather: self.weather.current, height: self.selected ==
                    0 ? gr.size.height : gr.size.height * 0.50).animation(.easeInOut(duration: 0.5))
            }
        }
    }
  }
}

extension Double {
    var round: Int {
        return Int(self)
    }
}




