//
//  PerspectiveView.swift
//  ScrollEffectApp
//
//  Created by Eric Callanan on 03/01/2024.
//

import SwiftUI

struct PerspectiveView: View {
    let animals = Animals()

    var body: some View {
        VStack {
            HeaderView(heading: "Perspective")

            ScrollView {
                LazyVStack {
                    ForEach (animals.animalList) { animal in
                        AnimalCardView(animal: animal)
                            .scrollTransition(.interactive) { content, phase in content
                                    .scaleEffect(phase.isIdentity ? 1.0 : 0.7)
                                    .rotation3DEffect(
                                        Angle.degrees(phase.value * -70.0),
                                        axis: (x: 1.0, y: 0.0, z: 0.0),
                                        perspective: 0.01)
                            }
                    }
                }
            }

        }
    }
}

#Preview {
    PerspectiveView()
}
