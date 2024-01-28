//
//  ThumbView.swift
//  ScrollEffectApp
//
//  Created by Eric Callanan on 03/01/2024.
//

import SwiftUI

struct ThumbView: View {
    var body: some View {
        VStack {
            ZStack {
                Color(hue: 0.58, saturation: 0.17, brightness: 1.0)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    AnimalCardView(animal: Animal(num: 11))
                        .offset(x:80)
                        .scaleEffect(0.8)
                    AnimalCardView(animal: Animal(num: 6))
                        .offset(x: -100)
                    AnimalCardView(animal: Animal(num: 19))
                        .offset(x: -100)
                    AnimalCardView(animal: Animal(num: 9))
                        .offset(x:80, y: 30)
                        .opacity(0.4)
                }
                .scaleEffect(0.5)
            }
        }
    }
}

#Preview {
    ThumbView()
}
