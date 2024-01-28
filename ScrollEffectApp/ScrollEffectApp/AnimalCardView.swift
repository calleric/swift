//
//  AnimalCardView.swift
//  ScrollEffectApp
//
//  Created by Eric Callanan on 03/01/2024.
//

import SwiftUI

struct AnimalCardView: View {
    var animal: Animal
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(.yellow.opacity(0.3))
                .frame(width: 320, height: 240)
                .shadow(color: .black, radius: 7, x: 8, y: 10)
            Image(animal.name)
                .resizable()
                .scaledToFit()
                .frame(width: 320, height: 240)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .overlay(RoundedRectangle(cornerRadius: 40)
                    .strokeBorder(Color.yellow.opacity(0.4), lineWidth: 6))
        }
    }
}

#Preview {
    AnimalCardView(animal: Animal(num: 25))
}

