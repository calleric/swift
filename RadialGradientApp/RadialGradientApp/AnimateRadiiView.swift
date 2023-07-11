//
//  AnimateRadiiView.swift
//  RadialGradientApp
//
//  Created by Eric Callanan on 08/07/2023.
//

import SwiftUI

struct AnimateRadiiView: View {
    @State private var startRadius:CGFloat = 0
    @State private var endRadius:CGFloat = 100
    
    let timer = Timer.publish(every: 2,
                              on: .main,
                              in: .common).autoconnect()
    
    func randomRadii() -> (CGFloat, CGFloat) {
        let radius1 = CGFloat(Double.random(in: 0...100))
        let radius2 = CGFloat(Double.random(in: 0...200))
        
        return (min(radius1, radius2), max(radius1, radius2))
    }
    
    var body: some View {
        VStack {
            Text("Change Start & End Radii")
                .font(.title)
                .fontWeight(.bold)
            
            Rectangle()
                .fill(
                    RadialGradient(colors: AppColors.rainbow,
                                   center: .center,
                                   startRadius: startRadius,
                                   endRadius: endRadius)
                )
                .animation(Animation.easeInOut.speed(0.2),
                           value: startRadius)
                .frame(width: 400, height: 400)
                .onReceive(timer) { _ in
                    (startRadius, endRadius) = randomRadii()
                }
            
            
            VStack(alignment: .trailing)  {
                HStack() {
                    Spacer()
                    Text("Start Radius: ")
                        .font(.title2)
                    Text("\(startRadius, specifier: "%.2F")")
                        .font(.title)
                        .frame(width: 130)
                        .animation(Animation.easeInOut.speed(0.6),
                                   value: startRadius)
                }
                HStack() {
                    Spacer()
                    Text("End Radius: ")
                        .font(.title2)
                    Text("\(endRadius, specifier: "%.2F")")
                        .font(.title)
                        .frame(width: 130)
                        .animation(Animation.easeInOut.speed(0.6),
                                   value: endRadius)
                }
            }
            .padding()
            .fontWeight(.bold)
            
            
            Spacer()
        }
        .padding()
    }
}

struct AnimateRadiiView_Previews: PreviewProvider {
    static var previews: some View {
        AnimateRadiiView()
    }
}
