//
//  ThumbView.swift
//  LinearGradientApp
//
//  Created by Eric Callanan on 23/05/2023.
//

import SwiftUI

struct ThumbView: View {
    var body: some View {
        VStack {
            ZStack {
                // Color(red: 214/255, green: 232/255, blue: 248/255)
                Color(hue: 0.58, saturation: 0.17, brightness: 1.0)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(colors: AppColors.rainbow,
                                           startPoint: .topTrailing,
                                           endPoint: .bottomLeading)
                        )
                        .frame(width: 200, height: 200)
                }
                .padding()
            }
        }
    }
}
struct ThumbView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbView()
    }
}
