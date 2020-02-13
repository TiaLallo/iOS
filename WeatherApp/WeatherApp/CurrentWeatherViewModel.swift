//
//  CurrentWeatherViewModel.swift
//  WeatherApp
//
//  Created by Tia Lallo on 31/01/2020.
//  Copyright © 2020 Tia Lallo. All rights reserved.
//

import SwiftUI
import Combine

final class CurrentWeatherViewModel: ObservableObject {
    @Published var current: Weather?
    
    init() {
        self.fetch()
    }
}

extension CurrentWeatherViewModel {
    func fetch(_ city: String = "lappeenranta") {
        API.fetchCurrentWeather(by: city) {
            self.current = $0
        }
    }
}
