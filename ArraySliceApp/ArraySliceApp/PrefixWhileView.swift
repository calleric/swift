//
//  PrefixWhileView.swift
//  ArraySliceApp
//
//  Created by Eric Callanan on 09/01/2023.
//

import SwiftUI

struct PrefixWhileView: View {
    let nums = [2, 7, 15, 8, 1, 6, 10, 14, 4, 11, 13, 12, 5, 3, 9]
    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.17, brightness: 1.0)
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                TitleView(title: "prefix(while:)")
                
                ScrollView {
                    OriginalArrayView(nums: nums)
                    
                    ArraySliceView(title: "prefix(while:)",
                                   label: "nums.prefix(while: {$0 != 6})",
                                   slice: nums.prefix(while: {$0 != 6}),
                                   labelWidth: 450)
                    
                    ArraySliceView(title: "prefix(while:)",
                                   label: "nums.prefix(while: {$0 < 10})",
                                   slice: nums.prefix(while: {$0 < 10}),
                                   labelWidth: 450)
                }
            }
            .padding(.horizontal, 60)
            .padding()
        }
    }
}

struct PrefixWhileView_Previews: PreviewProvider {
    static var previews: some View {
        PrefixWhileView()
    }
}

