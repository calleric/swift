//
//  ContentView.swift
//  ScrollingChartsApp
//
//  Created by Eric Callanan on 28/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack() {
            List {
                NavigationLink (destination: WeightChartView1(), label: {Text("Line Chart")})
                NavigationLink (destination: WeightChartView2(), label: {Text("Bar Chart")})
                NavigationLink (destination: WeightChartView3(), label: {Text("Line Chart with Scroll")})
                NavigationLink (destination: WeightChartView4(), label: {Text("Bar Chart with Scroll")})
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
