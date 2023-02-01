//
//  TitleView.swift
//  AsyncLetApp
//
//  Created by Eric Callanan on 11/01/2023.
//

import SwiftUI

struct TitleView: View {
    var title: [String]
    var body: some View {
        VStack {
            let titleHeight: CGFloat = CGFloat(40 + (40 * title.count))
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(hue: 0.65, saturation: 0.8, brightness: 0.5))
                .overlay {
                    Text(title.joined(separator: "\n"))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hue: 0.15, saturation: 0.5, brightness: 1.0))
                        .lineLimit(5)
                        .multilineTextAlignment(.center)
                }
                .frame(height: titleHeight)

            Spacer().frame(height: 30)
        }
        .padding()
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TitleView(title: ["Test1"])

            TitleView(title: ["Test1", "Test2"])

            TitleView(title: ["Test 2", "Test 2", "Test 3"])
        }
    }
}
