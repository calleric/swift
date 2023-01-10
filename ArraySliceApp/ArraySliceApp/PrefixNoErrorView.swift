//
//  PrefixNoErrorView.swift
//  ArraySliceApp
//
//  Created by Eric Callanan on 09/01/2023.
//

import SwiftUI

struct PrefixNoErrorView: View {
    let nums = [2, 7, 15, 8, 1]
    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.17, brightness: 1.0)
                .edgesIgnoringSafeArea(.all)

            VStack() {
                TitleView(title: "Prefix - maxLength does NOT have to be a valid index")

                ScrollView {
                    OriginalArrayView(nums: nums)
                    
                    ArraySliceView(title: "Prefix(7)",
                                   label: "nums.prefix(7)",
                                   slice: nums.prefix(7))
                    
                    ErrorView(title: "Array Slice [..<7]",
                              error: "Swift/Array.swift:405: \nFatal error: Array index is out of range")
                }
            }
            .padding(.horizontal, 60)
            .padding()
        }
    }
}

struct PrefixNoErrorView_Previews: PreviewProvider {
    static var previews: some View {
        PrefixNoErrorView()
    }
}
