//
//  RgbColorPaletteView.swift
//  ColorSelectionHsb
//
//  Created by Eric Callanan on 06/11/2022.
//

import SwiftUI

struct RgbColorPaletteView: View {
    var body: some View {
        VStack(spacing:5) {
            VStack {
                HStack {
                    Text("Red")
                        .frame(width: cellWidth)
                    Text("Green")
                        .frame(width: cellWidth * 11.0)
                    Text("Blue")
                        .frame(width: cellWidth)
                    Spacer()
                }
                HStack(spacing:1) {
                    Spacer()
                        .frame(width:cellWidth)
                    ForEach([0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0], id: \.self) { myGreen in
                        Text("\(myGreen, specifier: "%0.1F")")
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                            .frame(width:cellWidth)
                    }
                    Spacer()
                }
            }
                
            ForEach([0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0], id: \.self) { myRed in
                HStack(spacing:1) {
                    Text("\(myRed, specifier: "%0.1F")")
                        .frame(width:cellWidth)
                    ForEach([0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0], id: \.self) { myGreen in
                        HStack {
                            VStack(spacing:1) {
                                ForEach([0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0], id: \.self) { myBlue in
                                    Color(red: myRed, green: myGreen, blue: myBlue)
                                }
                                .frame(width:cellWidth)
                            }
                        }
                    }
                    VStack(spacing:13) {
                        Text(myRed == 0.0 ? "0.0" : "")
                        Image(systemName: "arrow.down")
                            .foregroundColor(myRed == 0.0 ? Color.black : .clear)
                        Text(myRed == 0.0 ? "1.0" : "")
                    }
                    .font(.footnote)
                    .frame(width:cellWidth * 0.7)

                    Spacer()
                }
            }
            Spacer()
        }
        .padding()
    }
    
    let cellWidth: CGFloat = 100
}

struct RgbColorPaletteView_Previews: PreviewProvider {
    static var previews: some View {
        RgbColorPaletteView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
