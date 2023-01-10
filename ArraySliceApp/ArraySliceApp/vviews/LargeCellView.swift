//
//  LargeCellView.swift
//  ArraySliceApp
//
//  Created by Eric Callanan on 09/01/2023.
//

import SwiftUI

struct LargeCellView: View {
    var value: String
    var bgColor = Color(hue: 0.75, saturation: 0.30, brightness: 1.00)
    var borderColor = Color.green
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(bgColor)
            .frame(width: 120, height: 120)
            .overlay {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .strokeBorder(borderColor, style: StrokeStyle(lineWidth: 4, dash: [4, 5]))
                    Text(value)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                }
            }
    }
}

struct LargeCellView_Previews: PreviewProvider {
    static var previews: some View {
        LargeCellView(value: "99")
    }
}
