//
//  ThumbView.swift
//  ColorConverterApp
//
//  Created by Eric Callanan on 28/04/2023.
//

import SwiftUI

struct ThumbView: View {
    var body: some View {
        let thumbColor = Color(red: 0.50, green: 0.32, blue: 0.96)
        let hsb = thumbColor.getHsb()
        ZStack {
            Color(hue: 0.58, saturation: 0.17, brightness: 1.0)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                HStack(spacing: 5) {
                    ForEach([1.0, 0.8, 0.6, 0.4, 0.2, 0.1], id: \.self) { factor in
                        let adjustedSaturation = hsb.1 * factor
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color(hue: hsb.0,
                                        saturation: adjustedSaturation,
                                        brightness: hsb.2))
                            .frame(width: 50, height: 100)
                    }
                }
                
                HStack(spacing: 5) {
                    ForEach([1.0, 0.8, 0.6, 0.4, 0.2, 0.1], id: \.self) { factor in
                        let adjustedBrightness = hsb.2 * factor
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color(hue: hsb.0,
                                        saturation: hsb.1,
                                        brightness: adjustedBrightness))
                            .frame(width: 50, height: 100)
                    }
                }
            }
            .padding()
        }
    }
}

struct ThumbView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbView()
    }
}


