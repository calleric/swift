//
//  ArraySliceView.swift
//  ArraySliceApp
//
//  Created by Eric Callanan on 09/01/2023.
//

import SwiftUI

struct ArraySliceView: View {
    var title: String
    var label: String
    var slice: ArraySlice<Int>
    var labelWidth: CGFloat = 350

    var body: some View {
        VStack(alignment: .leading, spacing: 20)  {
            Divider()
            Text(title).font(.largeTitle).fontWeight(.bold)
            HStack(spacing:0) {
                LabelView(value: label, width: labelWidth)
                ForEach(slice, id: \.self) {
                    CellView(value: "\($0)")
                }
            }
            HStack(spacing:0) {
                LabelView(value: "ArraySlice Indices", width: labelWidth)
                ForEach(slice.indices, id: \.self) {
                    CellView(value: "\($0)", bgColor: .clear, borderColor: .yellow)
                }
            }
            Spacer().frame(height: 30)
        }
    }
}

struct ArraySliceView_Previews: PreviewProvider {
    static var previews: some View {
        ArraySliceView(title: "Title", label: "label", slice: [1,2,3,4])
    }
}
