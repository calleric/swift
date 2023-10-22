//
//  InteractiveDonutView.swift
//  PieChartApp
//
//  Created by Eric Callanan on 15/10/2023.
//

import SwiftUI
import Charts

struct InteractiveDonutView: View {
    @State private var selectedAmount: Double? = nil
    let cumulativeIncomes: [(category: String, range: Range<Double>)]

    init() {
        var cumulative = 0.0
        self.cumulativeIncomes = donationsIncomeData.map {
            let newCumulative = cumulative + Double($0.amount)
            let result = (category: $0.category, range: cumulative ..< newCumulative)
            cumulative = newCumulative
            return result
        }
    }

    var selectedCategory: IncomeData? {
        if let selectedAmount,
           let selectedIndex = cumulativeIncomes
            .firstIndex(where: { $0.range.contains(selectedAmount) }) {
            return donationsIncomeData[selectedIndex]
        }
        return nil
    }
    
    var body: some View {
        VStack {
            GroupBox ( "2022 Donations and Legacies (€ million)") {
                Chart(donationsIncomeData) {
                    SectorMark(
                        angle: .value("Amount", $0.amount),
                        innerRadius: .ratio(selectedCategory == $0 ? 0.5 : 0.6),
                        outerRadius: .ratio(selectedCategory == $0 ? 1.0 : 0.9),
                        angularInset: 3.0
                    )
                    .cornerRadius(6.0)
                    .foregroundStyle(by: .value("category", $0.category))
                    
                    .opacity(selectedCategory == $0 ? 1.0 : 0.9)
                }
                // Set color for each data in the chart
                .chartForegroundStyleScale(
                    domain: donationsIncomeData.map  { $0.category },
                    range: chartColors
                )
                
                // Position the Legend
                .chartLegend(position: .bottom, alignment: .center)
                
                // Select a sector
                .chartAngleSelection(value: $selectedAmount)
                
                // Display data for selected sector
                .chartBackground { chartProxy in
                    GeometryReader { geometry in
                        let frame = geometry[chartProxy.plotFrame!]
                        VStack(spacing: 0) {
                            Text(selectedCategory?.category ?? "")
                                .multilineTextAlignment(.center)
                                .font(.body)
                                .foregroundStyle(.secondary)
                                .frame(width: 120, height: 80)
                            Text("€\(selectedCategory?.amount ?? 0, specifier: "%.1f") M")
                                .font(.title.bold())
                                .foregroundColor((selectedCategory != nil) ? .primary : .clear)
                        }
                        .position(x: frame.midX, y: frame.midY)
                    }
                }
            }
            .frame(height: 500)
            
  
//            // Testing chartAngleSelection
//            Text("SelectedAmount")
//            Text(selectedAmount?.formatted() ?? "none")

            Spacer()
        }
        .padding()
    }
}

#Preview {
    InteractiveDonutView()
}
