//
//  CellView.swift
//  ArraySliceApp
//
//  Created by Eric Callanan on 09/01/2023.
//

import SwiftUI

struct CellView: View {
    var value: String
    var bgColor = Color(hue: 0.75, saturation: 0.30, brightness: 1.00)
    var borderColor = Color(hue: 0.74, saturation: 1.00, brightness: 0.30)
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(bgColor)
            .frame(width: 50, height: 50)
            .overlay {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .strokeBorder(borderColor, style: StrokeStyle(lineWidth: 2, dash: [4, 5]))
                    Text(value)
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(value: "42")
    }
}
