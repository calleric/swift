//
//  Styles.swift
//  MatthewEffectApp
//
//  Created by Eric Callanan on 27/09/2022.
//

import SwiftUI

struct Styles: View {
    var body: some View {
        VStack {
            GroupBox {
                Text("Hello, World!")
            }
            .groupBoxStyle(YellowGroupBoxStyle())
            
            Button("button 1") {
            }
            .buttonStyle(ActionButtonStyle())
            
            Button("button 2") {
            }
            .disabled(true)
            .buttonStyle(ActionButtonStyle())
        }
    }
}


struct Styles_Previews: PreviewProvider {
    static var previews: some View {
        Styles()
    }
}


struct YellowGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .padding(.top, 20)
            .padding(20)
            .background(Colors.bgGradient)
            .cornerRadius(20)
            .overlay(
                configuration.label.padding(10),
                alignment: .top
            )
    }
}


struct ActionButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .frame(height:30)
            .padding(.horizontal, 20)
            .foregroundColor(.white)
            .padding(5)
            .background(isEnabled ? Colors.buttonGradient :  Colors.disabledbuttonGradient)
            .cornerRadius(25)
            .shadow(color: isEnabled ? .gray : .clear, radius:5, x:3.0, y:3.0)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}


struct Colors {
    static let barColor = Color(hue: 0.8, saturation: 0.7, brightness: 0.5)
    static let bgPlotColor = Color(hue: 0.12, saturation: 0.10, brightness: 0.92)
    
    static let bgGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(hue: 0.10, saturation: 0.10, brightness: 1.0),
            Color(hue: 0.10, saturation: 0.20, brightness: 0.95)
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    static let buttonGradient1 = LinearGradient(
        gradient: Gradient(colors: [
            Color(hue: 0.95, saturation: 0.7, brightness: 0.9),
            Color(hue: 0.0, saturation: 0.8, brightness: 0.93)
        ]),
        startPoint: .top,
        endPoint: .bottom)
    
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
