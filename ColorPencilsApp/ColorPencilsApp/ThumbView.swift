//
//  ThumbView.swift
//  ColorPencilsApp
//
//  Created by Eric Callanan on 11/05/2023.
//

import SwiftUI

struct ThumbView: View {
    var body: some View {
        VStack {
            ZStack {
                Color(hue: 0.58, saturation: 0.17, brightness: 1.0)
                    .edgesIgnoringSafeArea(.all)

                HStack {
                    ColorPencilView(color: .red)
                    ColorPencilView(color: .orange)
                    ColorPencilView(color: .yellow)
                    ColorPencilView(color: .green)
                    ColorPencilView(color: .blue)
                    ColorPencilView(color: Color(hue: 0.773, saturation: 1.0, brightness: 0.51))
                    ColorPencilView(color: Color(hue: 0.771, saturation: 1.0, brightness: 1.00))
                }
                .frame(width: 300, height: 200)            }
        }
    }
}

struct ThumbView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbView()
    }
}
