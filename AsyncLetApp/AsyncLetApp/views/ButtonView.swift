//
//  ButtonView.swift
//  AsyncLetApp
//
//  Created by Eric Callanan on 11/01/2023.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        VStack {
            Button("Enabled") { }
                .buttonStyle(BlueButtonStyle())
            Button("Disabled") { }
                .buttonStyle(BlueButtonStyle())
                .disabled(true)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}

struct BlueButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(5)
            .frame(width:200, height: 40)
            .background(isEnabled ? Color(hue: 0.65, saturation: 0.8, brightness: 0.5) : Color.gray)
            .cornerRadius(10)
            .padding(10)
            .shadow(color: isEnabled ? .black : .black.opacity(0.8),
                    radius: isEnabled ? 3 : 5,
                    x: isEnabled ? 3.0 : -1.0,
                    y: isEnabled ? 3.0 : -1.0)
            .scaleEffect(configuration.isPressed ? 0.95 : isEnabled ? 1.0 : 0.95)
    }
}
