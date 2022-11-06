//
//  HsbColorPaletteView.swift
//  ColorSelectionHsb
//
//  Created by Eric Callanan on 06/11/2022.
//

import SwiftUI

struct HsbColorPaletteView: View {
    var body: some View {
        VStack(spacing:5) {
            VStack {
                HStack {
                    Text("Hue")
                        .frame(width: cellWidth)
                    Text("Saturation")
                        .frame(width: cellWidth * 11.0)
                    Text("Brightness")
                        .frame(width: cellWidth)
                    Spacer()
                }
                HStack(spacing:1) {
                    Spacer()
                        .frame(width:cellWidth)
                    ForEach([0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0], id: \.self) { mySat in
                        Text("\(mySat, specifier: "%0.1F")")
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                            .frame(width:cellWidth)
                    }
                    Spacer()
                }
            }
                
            ForEach([0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0], id: \.self) { myHue in
                HStack(spacing:1) {
                    Text("\(myHue, specifier: "%0.1F")")
                        .frame(width:cellWidth)
                    ForEach([0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0], id: \.self) { mySat in
                        HStack {
                            VStack(spacing:1) {
                                //ForEach([1.0, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2, 0.1, 0.0], id: \.self) { myBright in
                                ForEach([1.0, 0.9, 0.8, 0.7, 0.6, 0.5], id: \.self) { myBright in
                                    Color(hue: myHue,
                                          saturation: mySat,
                                          brightness: myBright)
                                }
                                .frame(width:cellWidth)
                            }
                        }
                    }
                    VStack(spacing:13) {
                        Text(myHue == 0.0 ? "1.0" : "")
                        Image(systemName: "arrow.down")
                            .foregroundColor(myHue == 0.0 ? Color.black : .clear)
                        Text(myHue == 0.0 ? "0.5" : "")
                    }
                    .font(.footnote)
                    .frame(width:cellWidth * 0.5)

                    Spacer()
                }
            }
            Spacer()
        }
        .padding()
    }
    
    let cellWidth: CGFloat = 100
}

struct HsbColorPaletteView_Previews: PreviewProvider {
    static var previews: some View {
        HsbColorPaletteView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
