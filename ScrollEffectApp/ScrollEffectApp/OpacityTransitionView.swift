//
//  OpacityTransitionView.swift
//  ScrollEffectApp
//
//  Created by Eric Callanan on 03/01/2024.
//

import SwiftUI

struct OpacityTransitionView: View {
    let animals = Animals()

    var body: some View {
        VStack {
            HeaderView(heading: "Opacity Transition")

            ScrollView {
                LazyVStack {
                    ForEach (animals.animalList) { animal in
                        AnimalCardView(animal: animal)
                            .scrollTransition { content, phase in 
                                content.opacity(phase.isIdentity ? 1 : 0)
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    OpacityTransitionView()
}
