//
//  ThumbView.swift
//  PieChartApp
//
//  Created by Eric Callanan on 15/10/2023.
//

import SwiftUI
import Charts

struct ThumbView: View {
    var donationsIncomeDataSorted = donationsIncomeData
    
    init() {
        donationsIncomeDataSorted.sort {
            $0.amount > $1.amount
        }
    }
    
    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.17, brightness: 1.0)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Chart(donationsIncomeDataSorted) { income in
                    let amountStr = "\(income.amount)"
                    SectorMark(
                        angle: .value("Amount", income.amount),
                        angularInset: 3.0
                    )
                    .cornerRadius(6.0)
                    .foregroundStyle(by: .value("category", income.category))
                    .annotation(position: .overlay) {
                        Text(amountStr)
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(6)
                            .background(Color.white.opacity(0.4))
                    }
                }
                // Set color for each data in the chart
                .chartForegroundStyleScale(
                    domain: donationsIncomeDataSorted.map  { $0.category },
                    range: chartColors
                )
                
                // Position the Legend
                .chartLegend(.hidden)
                
                Spacer()
            }
            .padding(50)
        }
    }
}


#Preview {
    ThumbView()
}
