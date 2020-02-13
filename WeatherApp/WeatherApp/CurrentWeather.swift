//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Tia Lallo on 31/01/2020.
//  Copyright © 2020 Tia Lallo. All rights reserved.
//

import SwiftUI

struct CurrentWeather: View {
    
    var weather: Weather?
    @ObservedObject var current = CurrentWeatherViewModel()
    var height: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Today in \(weather?.name ?? "unknown")")
                .font(.title)
                .foregroundColor(.white)
                .bold()
            
            
             
            HStack{
                Text("\(weather?.main.temp.round ?? 0)°")
                    .foregroundColor(.white)
                    .fontWeight(Font.Weight.heavy)
                    .font(.system(size:65))
                Image("1")
               
            }
            Text("\(weather?.weather.last?.description ?? "Unknown")")
                .foregroundColor(.white)
                .font(.body)
            
            Text("Max  \(weather?.main.tempMax.round ?? 0)°")
                .foregroundColor(.white)
                .font(.body)
        }.frame(width: height, height: height)
            .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}


