//
//  ViewAlignedView.swift
//  ScrollEffectApp
//
//  Created by Eric Callanan on 03/01/2024.
//

import SwiftUI

struct ViewAlignedView: View {
    let animals = Animals()

    var body: some View {
        VStack {
            HeaderView(heading: "Scale & Opacity Transition")
            Text("viewAligned")

            ScrollView {
                LazyVStack {
                    ForEach (animals.animalList) { animal in
                        AnimalCardView(animal: animal)
                            .scrollTransition { content, phase in
                                content
                                    .scaleEffect(phase.isIdentity ? 1 : 0.3)
                                    .opacity(phase.isIdentity ? 1 : 0.3)
                            }
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
        }
    }
}

#Preview {
    ViewAlignedView()
}
