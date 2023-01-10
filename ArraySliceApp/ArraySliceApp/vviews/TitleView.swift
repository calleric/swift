//
//  TitleView.swift
//  ArraySliceApp
//
//  Created by Eric Callanan on 09/01/2023.
//

import SwiftUI

struct TitleView: View {
    var title: String
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(hue: 0.65, saturation: 0.8, brightness: 0.5))
                .overlay {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hue: 0.15, saturation: 0.5, brightness: 1.0))
                }
            .frame(height:80)
            
            Spacer().frame(height: 30)
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Title")
    }
}
