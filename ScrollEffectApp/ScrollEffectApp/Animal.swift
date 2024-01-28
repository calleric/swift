//
//  Animal.swift
//  ScrollEffectApp
//
//  Created by Eric Callanan on 15/01/2024.
//

import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    
    init(num: Int) {
        self.name = "animal-\( String(repeating: "0", count: num < 10 ? 1 : 0) )\(num)"
    }
}


struct Animals {
    var animalList: [Animal]
    
    init() {
        animalList = []
        for i in 1...25 {
            animalList.append(Animal(num: i))
        }
    }
    
}
