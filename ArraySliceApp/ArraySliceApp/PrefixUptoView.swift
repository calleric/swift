//
//  PrefixUptoView.swift
//  ArraySliceApp
//
//  Created by Eric Callanan on 09/01/2023.
//

import SwiftUI

struct PrefixUptoView: View {
    let nums = [2, 7, 15, 8, 1, 6, 10, 14, 4, 11, 13, 12, 5, 3, 9]
    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.17, brightness: 1.0)
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                TitleView(title: "prefix(upTo:)")
                
                ScrollView {
                    OriginalArrayView(nums: nums)
                    
                    ArraySliceView(title: "prefix(upTo: 7)",
                                   label: "nums.prefix(upTo: 7)",
                                   slice: nums.prefix(upTo: 7))
                    
                    ArraySliceView(title: "Array Slice [..<7]",
                                   label: "nums[..<7]",
                                   slice: nums[..<7])
                }
            }
            .padding(.horizontal, 60)
            .padding()
        }
    }
}

struct PrefixUptoView_Previews: PreviewProvider {
    static var previews: some View {
        PrefixUptoView()
    }
}
