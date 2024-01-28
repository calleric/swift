//
//  OffsetTransitionView.swift
//  ScrollEffectApp
//
//  Created by Eric Callanan on 03/01/2024.
//

import SwiftUI

struct OffsetTransitionView: View {
    let animals = Animals()
    
    var body: some View {
        VStack {
            HeaderView(heading: "Offset Transition")
            
            ScrollView {
                LazyVStack {
                    ForEach (animals.animalList) { animal in
                        AnimalCardView(animal: animal)
                            .scrollTransition { content, phase in 
                                content.offset(x: phase.isIdentity ? 0 : 400)
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    OffsetTransitionView()
}
