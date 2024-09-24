//
//  User.swift
//  APICombineDemo
//
//  Created by Marco Alonso on 23/09/24.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

struct Geo: Codable {
    let lat: String
    let lng: String
}
