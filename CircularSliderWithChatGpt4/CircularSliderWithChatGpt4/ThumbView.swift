//
//  ThumbView.swift
//  CircularSliderWithChatGpt4
//
//  Created by Eric Callanan on 15/04/2023.
//

import SwiftUI

struct ThumbView: View {
    var body: some View {
        ZStack {
            // Color(red: 214/255, green: 232/255, blue: 248/255)
            Color(hue: 0.58, saturation: 0.17, brightness: 1.0)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                CircularSlider5b(size: 200)
                HStack(spacing: 20) {
                    CircularSlider5b(size: 100)
                    VStack {
                        CircularSlider5b(size: 50)
                        HStack {
                            CircularSlider5b(size: 25)
                            VStack {
                                CircularSlider5b(size: 10)
                                CircularSlider5b(size: 10)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ThumbView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbView()
    }
}
