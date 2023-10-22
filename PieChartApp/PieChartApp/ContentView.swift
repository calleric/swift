//
//  ContentView.swift
//  PieChartApp
//
//  Created by Eric Callanan on 15/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack() {
            List {
                NavigationLink (destination: BarChartView(), label: {Text("01 Bar Chart")})
                NavigationLink (destination: BarAndPieChartView(), label: {Text("02 Bar and Pie Chart")})
                NavigationLink (destination: RoundedSectorSpaceView(), label: {Text("03 Rounded Sectors with spaces")})
                NavigationLink (destination: DonutChartView(), label: {Text("04 Donut Chart")})
                NavigationLink (destination: PieChartColorsView(), label: {Text("05 Pie Chart with custom colors")})
                NavigationLink (destination: InteractiveDonutView(), label: {Text("06 Interactive Donut Chart")})
                NavigationLink (destination: DonutChartSortedView(), label: {Text("07 Donut Chart Sorted Data")})
                NavigationLink (destination: DonutWithLabelsView(), label: {Text("08 Donut with Labels")})
            }
        }
    }
}

#Preview {
    ContentView()
}
