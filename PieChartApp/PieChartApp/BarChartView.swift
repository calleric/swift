//
//  BarChartView.swift
//  PieChartApp
//
//  Created by Eric Callanan on 15/10/2023.
//

import SwiftUI
import Charts

struct BarChartView: View {
    var body: some View {
        VStack {
            GroupBox ( "Bar Chart - 2022 Income (€ million)") {
                Chart(totalIncomeData) {
                    BarMark(
                        x: .value("Category", $0.category),
                        y: .value("Amount", $0.amount)
                    )
                }
            }
            .frame(height: 300)
            
            GroupBox ("2022 Donations and legacies (€ million)") {
                Chart(donationsIncomeData) {
                    BarMark(
                        x: .value("Category", $0.category),
                        y: .value("Amount", $0.amount)
                    )
                }
            }
            .frame(height: 300)
            

            Spacer()
        }
        .padding()
    }
}


#Preview {
    BarChartView()
}

