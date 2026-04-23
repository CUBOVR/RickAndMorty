//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by Cristobal Urquides on 21/04/26.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable{
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [RMCharacter]
}
