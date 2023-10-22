//
//  BarAndPieChartView.swift
//  PieChartApp
//
//  Created by Eric Callanan on 15/10/2023.
//

import SwiftUI
import Charts

struct BarAndPieChartView: View {
    var body: some View {
        VStack {
            GroupBox ( "Bar Chart - 2022 Donations and legacies (€ million)") {
                Chart(donationsIncomeData) {
                    BarMark(
                        x: .value("Amount", $0.amount),
                        stacking: .normalized
                    )
                    .foregroundStyle(by: .value("category", $0.category))
                }
            }
            .frame(height: 200)
            
            GroupBox ( "Pie Chart - 2022 Donations and legacies (€ million)") {
                Chart(donationsIncomeData) {
                    SectorMark(
                        angle: .value("Amount", $0.amount)
                    )
                    .foregroundStyle(by: .value("category", $0.category))
                }
            }
            .frame(height: 500)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    BarAndPieChartView()
}
