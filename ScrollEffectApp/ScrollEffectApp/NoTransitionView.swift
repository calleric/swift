//
//  NoTransitionView.swift
//  ScrollEffectApp
//
//  Created by Eric Callanan on 03/01/2024.
//

import SwiftUI

struct NoTransitionView: View {
    let animals = Animals()
    
    var body: some View {
        VStack {
            HeaderView(heading: "No Transition")

            ScrollView {
                LazyVStack {
                    ForEach (animals.animalList) { animal in
                        AnimalCardView(animal: animal)
                    }
                }
            }
        }
    }
}

#Preview {
    NoTransitionView()
}


struct HeaderView: View {
    var heading: String
    
    var body: some View {
        Text(heading)
            .font(.title)
            .fontWeight(.bold)
    }
}
