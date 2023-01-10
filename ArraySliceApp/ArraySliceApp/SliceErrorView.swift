//
//  SliceErrorView.swift
//  ArraySliceApp
//
//  Created by Eric Callanan on 09/01/2023.
//

import SwiftUI

struct SliceErrorView: View {
    let nums = [2, 7, 15, 8, 1]
    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.17, brightness: 1.0)
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                TitleView(title: "Array Slice requires a valid index")
                
                ScrollView {
                    OriginalArrayView(nums: nums)
                    
                    ArraySliceView(title: "Array Slice [..<4]",
                                   label: "nums[..<4]",
                                   slice: nums[..<4])
                    
                    ErrorView(title: "Array Slice [..<7]",
                              error: "Swift/Array.swift:405: \nFatal error: Array index is out of range")
                }
            }
            .padding(.horizontal, 60)
            .padding()
        }
    }
}

struct SliceErrorView_Previews: PreviewProvider {
    static var previews: some View {
        SliceErrorView()
    }
}
