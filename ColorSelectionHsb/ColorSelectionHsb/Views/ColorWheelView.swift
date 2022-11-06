//
//  ColorWheelView.swift
//  ColorSelectionHsb
//
//  Created by Eric Callanan on 06/11/2022.
//

import SwiftUI

struct ColorWheelView: View {
    @State private var hue: Double = 180.0
        
    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.17, brightness: 1.0)
                    .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                VStack(spacing: 5) {
                    Text("Select Hue")
                        .font(.system(size: 40, weight: .bold, design:.rounded))
                    HStack {
                        CircularSliderView(value: $hue, in: 0...360)
                            .frame(width: 300, height: 300)
                    }
                }
                
                VStack(spacing: 5) {
                    Text("Selected Hue with decreasing Saturation")
                        .font(.system(size: 40, weight: .bold, design:.rounded))
                    HStack() {
                        ForEach([1.0, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2, 0.1, 0.0], id: \.self) { mySat in
                            VStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(hue: hue/360,
                                                saturation: mySat,
                                                brightness: 1.0))
                                    .frame(height:100)
                                    .overlay {
                                        Text("\(mySat, specifier: "%0.1F")")
                                            .font(.system(size: 30))
                                }
                                Text("H: \(hue/360, specifier: "%0.2F")")
                                Text("S: \(mySat, specifier: "%0.2F")")
                                Text("B: 1.00")
                            }
                        }
                    }
                    .padding(.horizontal, 100)
                }
                            
                VStack(spacing: 5) {
                    Text("Selected Hue with decreasing Brightness")
                        .font(.system(size: 40, weight: .bold, design:.rounded))
                    HStack() {
                        ForEach([1.0, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2, 0.1, 0.0], id: \.self) { myBright in
                            VStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(hue: hue/360,
                                                saturation: 1.0,
                                                brightness: myBright))
                                    .frame(height:100)
                                    .overlay {
                                        Text("\(myBright, specifier: "%0.1F")")
                                            .font(.system(size: 30))
                                            .foregroundColor(myBright > 0.5 ? Color.black : .white)
                                }
                                Text("H: \(hue/360, specifier: "%0.2F")")
                                Text("S: 1.00")
                                Text("B: \(myBright, specifier: "%0.2F")")
                            }
                        }
                    }
                    .padding(.horizontal, 100)
                }
                
                Spacer()
            }
        }
    }
}

struct ColorWheelView_Previews: PreviewProvider {
    static var previews: some View {
        ColorWheelView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
