//
//  SliceStartView.swift
//  ArraySliceApp
//
//  Created by Eric Callanan on 09/01/2023.
//

import SwiftUI

struct SliceStartView: View {
    let nums = [2, 7, 15, 8, 1, 6, 10, 14, 4, 11, 13, 12, 5, 3, 9]
    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.17, brightness: 1.0)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack() {
                TitleView(title: "Array Slice at begining or end")
                ScrollView {    
                    OriginalArrayView(nums: nums)
                    
                    ArraySliceView(title: "Array Slice [..<7]",
                                   label: "nums[..<7]",
                                   slice: nums[..<7])
                    
                    ArraySliceView(title: "Array Slice [...7]",
                                   label: "nums[...7]",
                                   slice: nums[...7])
                    
                    ArraySliceView(title: "Array Slice [7...]",
                                   label: "nums[7...]",
                                   slice: nums[7...])
                }
            }
            .padding(.horizontal, 60)
            .padding()
        }
    }
}

struct SliceStartView_Previews: PreviewProvider {
    static var previews: some View {
        SliceStartView()
    }
}

