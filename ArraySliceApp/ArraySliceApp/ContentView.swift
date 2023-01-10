//
//  ContentView.swift
//  ArraySliceApp
//
//  Created by Eric Callanan on 09/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack() {
            List {
                NavigationLink (destination: SliceMidView(), label: {Text("01 SliceMidView")})
                NavigationLink (destination: SliceStartView(), label: {Text("02 SliceStartView")})
                NavigationLink (destination: SliceErrorView(), label: {Text("03 SliceErrorView")})
                NavigationLink (destination: PrefixView(), label: {Text("04 PrefixView")})
                NavigationLink (destination: PrefixNoErrorView(), label: {Text("05 PrefixNoErrorView")})
                NavigationLink (destination: PrefixThroughView(), label: {Text("06 PrefixThroughView")})
                NavigationLink (destination: PrefixUptoView(), label: {Text("07 PrefixUptoView")})
                NavigationLink (destination: PrefixWhileView(), label: {Text("08 PrefixWhileView")})
                NavigationLink (destination: ThumbView(), label: {Text("09 ThumbView")})
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
