//
//  model.swift
//  iOS swiftui practices
//
//  Created by sergio shaon on 28/3/21.
//

import Foundation

struct model : Codable {
    var coord : Coordinator
}
struct Coordinator : Codable {
    var lon : Double
    var lat : Double
}
