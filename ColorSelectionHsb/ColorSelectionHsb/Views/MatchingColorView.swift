//
//  MatchingColorView.swift
//  ColorSelectionHsb
//
//  Created by Eric Callanan on 06/11/2022.
//

import SwiftUI

struct MatchingColorView: View {
    @ObservedObject private var colorVm = ColorViewModel()
    
    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.17, brightness: 1.0)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing:30) {
                HStack {
                    VStack(spacing: 5) {
                        Text("Select Hue")
                            .font(.system(size: 40, weight: .bold, design:.rounded))
                        HStack {
                            CircularSliderView(value: $colorVm.colorModel.hueDegrees, in: 0...360)
                                .frame(width: 300, height: 300)
                        }
                    }
                    
                    Spacer().frame(width: 200)
                    
                    VStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(colorVm.selectedColor)
                            .frame(width: 300, height: 250, alignment: .center)
                        Text("Selected Color")
                            .font(.system(size: 30, weight: .bold, design:.rounded))
                    }
                }
                
                VStack(spacing:20) {
                    HStack {
                        Text("Monochromatic")
                            .frame(width: 300, alignment: .trailing)
                        ForEach(colorVm.monochromaticColors, id: \.self) { col in
                            RoundedRectangle(cornerRadius: 20)
                                .fill(col)
                        }
                    }
                    HStack {
                        Text("Analogous")
                            .frame(width: 300, alignment: .trailing)
                        ForEach(colorVm.analogousColors, id: \.self) { col in
                            RoundedRectangle(cornerRadius: 20)
                                .fill(col)
                        }
                    }
                    HStack {
                        Text("Complementary")
                            .frame(width: 300, alignment: .trailing)
                        ForEach(colorVm.complementaryColors, id: \.self) { col in
                            RoundedRectangle(cornerRadius: 20)
                                .fill(col)
                        }
                    }
                    HStack {
                        Text("Triadic")
                            .frame(width: 300, alignment: .trailing)
                        ForEach(colorVm.triadicColors, id: \.self) { col in
                            RoundedRectangle(cornerRadius: 20)
                                .fill(col)
                        }
                    }
                }
                .padding(.horizontal, 100)
                .font(.system(size: 30, weight: .bold, design:.rounded))
            }
            .padding(50)
        }
    }
}

struct MatchingColorView_Previews: PreviewProvider {
    static var previews: some View {
        MatchingColorView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
