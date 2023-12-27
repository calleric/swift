//
//  Utilities.swift
//  GameOfLifeApp
//
//  Created by Eric Callanan on 27/12/2023.
//

import SwiftUI

struct ActionButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .frame(width: 90, height:30)
            .padding(.horizontal, 20)
            .foregroundColor(.white)
            .padding(5)
            .background(isEnabled ? Colors.buttonGradient :  Colors.disabledbuttonGradient)
            .cornerRadius(10)
            .shadow(color: isEnabled ? .gray : .clear, radius:5, x:3.0, y:3.0)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}


struct YellowGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(width: 250)
            .padding(.top, 5)
            .padding(10)
            .background(Colors.bgGradient)
            .cornerRadius(10)
            .overlay(
                configuration.label.padding(10),
                alignment: .top
            )
    }
}


struct Colors {
    static let bgGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(hue: 0.10, saturation: 0.10, brightness: 1.0),
            Color(hue: 0.10, saturation: 0.20, brightness: 0.95)
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    static let buttonGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(hue: 0.75, saturation: 0.8, brightness: 0.8),
            Color(hue: 0.75, saturation: 0.8, brightness: 0.5),
            Color(hue: 0.75, saturation: 0.8, brightness: 0.4)
        ]),
        startPoint: .top,
        endPoint: .bottom)
    
    static let disabledbuttonGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(.gray),
            Color(.black).opacity(0.5)]),
        startPoint: .top,
        endPoint: .bottom)
}

