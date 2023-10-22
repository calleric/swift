//
//  DonutChartView.swift
//  PieChartApp
//
//  Created by Eric Callanan on 15/10/2023.
//

import SwiftUI
import Charts

struct DonutChartView: View {
    var body: some View {
        VStack {
            GroupBox ("2022 Donations and Legacies (€ million)") {
                Chart(donationsIncomeData) {
                    SectorMark(
                        angle: .value("Amount", $0.amount),
                        innerRadius: .ratio(0.6),
                        angularInset: 3.0
                    )
                    .cornerRadius(6.0)
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
    DonutChartView()
}
