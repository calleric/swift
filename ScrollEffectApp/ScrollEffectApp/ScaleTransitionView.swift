//
//  ScaleTransitionView.swift
//  ScrollEffectApp
//
//  Created by Eric Callanan on 03/01/2024.
//

import SwiftUI

struct ScaleTransitionView: View {
    let animals = Animals()
    
    var body: some View {
        VStack {
            HeaderView(heading: "Scale Transition")
            
            ScrollView {
                LazyVStack {
                    ForEach (animals.animalList) { animal in
                        AnimalCardView(animal: animal)
                            .scrollTransition { content, phase in
                                content.scaleEffect(phase.isIdentity ? 1 : 0.6)
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    ScaleTransitionView()
}
