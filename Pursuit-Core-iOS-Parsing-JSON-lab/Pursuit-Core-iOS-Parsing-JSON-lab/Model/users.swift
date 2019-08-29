//
//  users.swift
//  Pursuit-Core-iOS-Parsing-JSON-lab
//
//  Created by Jack Wong on 8/28/19.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import Foundation

struct User: Codable {
    let name: UserNameWrapper
    let email: String
    let location: UserLocationWrapper
    let phone: String
    let dob: UserDOBWrapper
    
   
}

struct UserNameWrapper: Codable {
    let first: String
    let last: String
}

struct UserLocationWrapper: Codable {
    let street: String
    let city: String
    let state: String
    let postcode: Int
}

struct UserDOBWrapper: Codable {
    let date: String
}
