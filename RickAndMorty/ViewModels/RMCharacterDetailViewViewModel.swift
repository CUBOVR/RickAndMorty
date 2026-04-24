//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Cristobal Urquides on 23/04/26.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    init(character: RMCharacter){
        self.character = character
    }
    
    public var title:String {
        character.name.uppercased()
    }
}
