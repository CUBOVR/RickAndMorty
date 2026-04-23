//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Cristobal Urquides on 20/04/26.
//

import Foundation

struct RMLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
