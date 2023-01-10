//
//  LabelView.swift
//  ArraySliceApp
//
//  Created by Eric Callanan on 09/01/2023.
//

import SwiftUI

struct LabelView: View {
    var value: String
    var width: CGFloat = 350

    var body: some View {
        HStack {
            Spacer()
            Text(value)
                .font(.title)
                .fontWeight(.medium)
            .padding(.horizontal, 20)
        }
        .frame(width: width, height: 60)
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView(value: "some label")
    }
}
