//
//  model.swift
//  iOS swiftui practices
//
//  Created by sergio shaon on 28/3/21.
//

import Foundation

struct model : Decodable {
    let coord : Coordinator
}
struct Coordinator : Decodable {
    let lon, lat : Double
}
