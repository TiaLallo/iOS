//
//  Weather.swift
//  WeatherApp
//
//  Created by Tia Lallo on 27/01/2020.
//  Copyright © 2020 Tia Lallo. All rights reserved.
//

import Foundation

struct Weather: Codable{
    let id, dt, cod, timezone: Int
    let name, base: String
    let coord: Coord
    let weather: [WeatherData]
    let main: Main
    //let clouds: Clouds
    //let sys: Sys
}
struct Coord: Codable{
    let lon, lat: Double
}
struct WeatherData: Codable, Identifiable {
    let id: Int
    let main, description, icon: String
}
struct Main: Codable {
    let temp, tempMin, tempMax: Double
    let pressure, humidity: Int
}
struct Clouds: Codable {
    let all: String
}
struct Sys: Codable {
    let id, type, sunrise, sunset: Int
    let country: String
}


