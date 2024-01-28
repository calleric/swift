//
//  ScaleOpacityRotationView.swift
//  ScrollEffectApp
//
//  Created by Eric Callanan on 03/01/2024.
//

import SwiftUI

struct ScaleOpacityRotationView: View {
    let animals = Animals()

    var body: some View {
        VStack {
            HeaderView(heading: "Scale, Opacity,")
            HeaderView(heading: "Rotation and Offset")

            ScrollView {
                LazyVStack {
                    ForEach (animals.animalList) { animal in
                        AnimalCardView(animal: animal)
                            .scrollTransition(.interactive) { content, phase in 
                                content
                                    .scaleEffect(phase.isIdentity ? 1.0 : 0.2)
                                    .opacity(phase.isIdentity ? 1 : 0.5)
                                    .rotation3DEffect(
                                        Angle.degrees(phase.isIdentity ? 0: 90),
                                        axis: (x: 0.5, y: 0.0, z: 0.1))
                                    .offset(x: phase.value * -200)
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
    ScaleOpacityRotationView()
}
