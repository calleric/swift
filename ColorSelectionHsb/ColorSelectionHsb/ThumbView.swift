//
//  ThumbView.swift
//  ColorSelectionHsb
//
//  Created by Eric Callanan on 06/11/2022.
//

import SwiftUI

struct ThumbView: View {
    @State private var hue: Double = 272.0
    
    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.17, brightness: 1.0)
                    .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                CircularSliderView(value: $hue, in: 0...360)
                    .frame(width: 300, height: 300)
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(hue: self.hue/360.0, saturation: 1.0, brightness: 1.0))
                    .frame(width: 300, height: 50, alignment: .center)
            }
        }
    }
}


struct ThumbView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbView()
    }
}
