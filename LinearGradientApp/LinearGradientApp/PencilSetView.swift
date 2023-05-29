//
//  PencilSetView.swift
//  LinearGradientApp
//
//  Created by Eric Callanan on 23/05/2023.
//

import SwiftUI




struct PencilSetView: View {
    var body: some View {
        VStack {
            Text("Color Pencils")
                .font(.largeTitle)
            HStack {
                ForEach(AppColors.rainbow, id: \.self) {
                    ColorPencilView(color: $0)
                        .frame(width: 50, height: 300)
                }
            }
            Spacer()
        }
    }
}







struct PencilSetView_Previews: PreviewProvider {
    static var previews: some View {
        PencilSetView()
    }
}
