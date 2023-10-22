//
//  DonutWithLabelsView.swift
//  PieChartApp
//
//  Created by Eric Callanan on 15/10/2023.
//

import SwiftUI
import Charts

struct DonutWithLabelsView: View {
    @State private var selectedAmount: Double? = nil
    let cumulativeIncomes: [(category: String, range: Range<Double>)]
    
    var donationsIncomeDataSorted = donationsIncomeData
    
    init() {
        donationsIncomeDataSorted.sort {
            $0.amount > $1.amount
        }

        var cumulative = 0.0
        self.cumulativeIncomes = donationsIncomeDataSorted.map {
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
            return donationsIncomeDataSorted[selectedIndex]
        }
        return nil
    }
    
    var body: some View {
        VStack {
            GroupBox ( "2022 Donations and Legacies (€ million)") {
                Chart(donationsIncomeDataSorted) { income in
                    let amountStr = "\(income.amount)"
                    SectorMark(
                        angle: .value("Amount", income.amount),
                        innerRadius: .ratio(selectedCategory == income ? 0.5 : 0.6),
                        outerRadius: .ratio(selectedCategory == income ? 1.0 : 0.9),
                        angularInset: 3.0
                    )
                    .cornerRadius(6.0)
                    .foregroundStyle(by: .value("category", income.category))
                    .opacity(selectedCategory == income ? 1.0 : 0.8)
                    .annotation(position: .overlay) {
                        Text(amountStr)
                            .font(selectedCategory == income ? .title : .headline)
                            .fontWeight(.bold)
                            .padding(5)
                            .background(Color.accentColor.opacity(0.1))
                    }
                }
                // Set color for each data in the chart
                .chartForegroundStyleScale(
                    domain: donationsIncomeDataSorted.map  { $0.category },
                    range: chartColors
                )
                
                // Position the Legend
                .chartLegend(position: .top, alignment: .center)
                
                // Select a sector
                .chartAngleSelection(value: $selectedAmount)
                
                .chartBackground { chartProxy in
                    GeometryReader { geometry in
                        let frame = geometry[chartProxy.plotFrame!]
                        VStack(spacing: 0) {
                            Text(selectedCategory?.category ?? "")
                                .multilineTextAlignment(.center)
                                .font(.body)
                                .foregroundStyle(.secondary)
                                .frame(width: 120, height: 80)
                            Text("\(selectedCategory?.amount ?? 0, specifier: "%.1f")")
                                .font(.title.bold())
                                .foregroundColor((selectedCategory != nil) ? .primary : .clear)
                        }
                        .position(x: frame.midX, y: frame.midY)
                    }
                }
                
            }
            .frame(height: 500)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    DonutWithLabelsView()
}
