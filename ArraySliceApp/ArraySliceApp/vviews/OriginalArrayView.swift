//
//  OriginalArrayView.swift
//  ArraySliceApp
//
//  Created by Eric Callanan on 09/01/2023.
//

import SwiftUI

struct OriginalArrayView: View {
    var nums: [Int]

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20)  {
                Text("Original Array").font(.largeTitle).fontWeight(.bold)
                HStack(spacing:0) {
                    ForEach(nums, id: \.self) {
                        CellView(value: "\($0)")
                    }
                }
                Text("Array Indices").font(.largeTitle).fontWeight(.medium)
                HStack(spacing:0) {
                    ForEach(nums.indices, id: \.self) {
                        CellView(value: "\($0)",
                                 bgColor: .clear,
                                 borderColor: Color(hue: 0.10, saturation: 0.90, brightness: 1.00))
                    }
                }
                Spacer().frame(height: 40)
            }
            Spacer()
        }
    }
}

struct OriginalArrayView_Previews: PreviewProvider {
    static var previews: some View {
        OriginalArrayView(nums: [1,2,3,4])
    }
}
