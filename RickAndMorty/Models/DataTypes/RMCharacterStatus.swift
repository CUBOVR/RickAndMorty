//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Cristobal Urquides on 21/04/26.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    var text:String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
