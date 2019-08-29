//
//  weather.swift
//  Pursuit-Core-iOS-Parsing-JSON-lab
//
//  Created by Jack Wong on 8/27/19.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import Foundation

enum JSONError: Error {
    case decodingError(Error)
}

struct Cities: Codable {
    let list: [CityInfo]
}

struct CityInfo: Codable {
    var id: Int
    var name: String
    var main: MainWrapper
    var weather: [WeatherWrapper]
}

struct MainWrapper: Codable {
    var temp: Double
}

struct WeatherWrapper: Codable {
    var main: String
    var description: String
}

