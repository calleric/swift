//
//  ContentView.swift
//  EmployeeNavigationSplitViewApp
//
//  Created by Eric Callanan on 20/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack() {
            List {
                NavigationLink (destination: TwoColumnView(), label: {Text("01 TwoColumnView")})
                NavigationLink (destination: ThreeColumnView(), label: {Text("02 ThreeColumnView")})
                NavigationLink (destination: ThreeColumnVisibilityView(), label: {Text("03 ThreeColumnVisibilityView")})
                NavigationLink (destination: ThreeColumnDepartmentView(), label: {Text("04 ThreeColumnDepartmentView")})
                NavigationLink (destination: ThreeColumnSingleView(), label: {Text("05 ThreeColumnSingleView")})
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
