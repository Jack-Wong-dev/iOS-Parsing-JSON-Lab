//
//  color.swift
//  Pursuit-Core-iOS-Parsing-JSON-lab
//
//  Created by Jack Wong on 8/28/19.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import Foundation

struct Color: Codable {
    let name: ColorNameWrapper
    let hex: ColorHexWrapper
    var rgb: ColorRGBWrapper
    let a: Int = 1
}

struct ColorNameWrapper: Codable {
    let value: String
}

struct ColorHexWrapper: Codable {
    let value: String
}

struct ColorRGBWrapper: Codable {
    var r: Double
    var g: Double
    var b: Double
    
    mutating func getValue() {
        self.r /= 255
        self.g /= 255
        self.b /= 255
    }
}
