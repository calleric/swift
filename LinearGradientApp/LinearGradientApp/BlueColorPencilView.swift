//
//  BlueColorPencilView.swift
//  LinearGradientApp
//
//  Created by Eric Callanan on 23/05/2023.
//

import SwiftUI

struct BlueColorPencilView: View {
    var body: some View {
        VStack {
            Text("Blue Pencil")
                .font(.largeTitle)
            ColorPencilView(color: .blue)
                .frame(width: 100, height: 600)
        }
    }
}




















struct BlueColorPencilView_Previews: PreviewProvider {
    static var previews: some View {
        BlueColorPencilView()
    }
}


