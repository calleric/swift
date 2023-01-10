//
//  ThumbView.swift
//  ArraySliceApp
//
//  Created by Eric Callanan on 09/01/2023.
//

import SwiftUI

struct ThumbView: View {
    let nums = [2, 7, 15, 8, 1, 6, 10, 14]
    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.17, brightness: 1.0)
                .edgesIgnoringSafeArea(.all)

            VStack() {
                TitleView(title: "Array Slice thumbnail")
                Spacer()
            }
            .padding()
            
            HStack(spacing:0) {
                ForEach(nums, id: \.self) {
                    CellView(value: "\($0)")
                }
            }
            .offset(x: 0, y: -125)

            Rectangle()
                .strokeBorder(.green, style: StrokeStyle(lineWidth: 8, dash: [14, 5]))
                .frame(width: 160, height: 80, alignment: .center)
                .offset(x: 26, y: -125)
            

            Rectangle()
                .strokeBorder(.green, style: StrokeStyle(lineWidth: 4, dash: [4, 12]))
                .frame(width: 240, height: 4)
                .rotationEffect(Angle(degrees: -57))
                .offset(x: -112, y: -60)

            Rectangle()
                .strokeBorder(.green, style: StrokeStyle(lineWidth: 4, dash: [4, 12]))
                .frame(width: 280, height: 4)
                .rotationEffect(Angle(degrees: -63))
                .offset(x: -112, y: 30)

            Rectangle()
                .strokeBorder(.green, style: StrokeStyle(lineWidth: 4, dash: [8, 12]))
                .frame(width: 210, height: 4)
                .rotationEffect(Angle(degrees: 70))
                .offset(x: 142, y: -58)

            Rectangle()
                .strokeBorder(.green, style: StrokeStyle(lineWidth: 4, dash: [8, 12]))
                .frame(width: 260, height: 4)
                .rotationEffect(Angle(degrees: 74))
                .offset(x: 144, y: 40)



            HStack(spacing:0) {
                ForEach(nums[3..<6], id: \.self) {
                    LargeCellView(value: "\($0)")
                }
            }
            .offset(x:0, y:100)
            
        }
    }
}

struct ThumbView_Previews: PreviewProvider {
    static var previews: some View {
        ThumbView()
    }
}


