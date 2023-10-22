//
//  IncomeData.swift
//  PieChartApp
//
//  Created by Eric Callanan on 15/10/2023.
//

import SwiftUI

struct IncomeData: Identifiable, Equatable {
    var category: String
    var amount: Double
    var id = UUID()
}

let totalIncomeData: [IncomeData] = [
    .init(category: "Donations and legacies", amount: 19.8),
    .init(category: "Trading activities", amount: 4.2),
    .init(category: "Charitable activities", amount: 2.4),
    .init(category: "Other and investment", amount: 0.2)
]

let donationsIncomeData: [IncomeData] = [
    .init(category: "Legacies", amount: 2.4),
    .init(category: "Other national campaigns and donations", amount: 5.5),
    .init(category: "Daffodil Day", amount: 4.7),
    .init(category: "Philanthropy and corporate partnerships", amount: 4.0),
    .init(category: "Individual giving", amount: 3.2)
]

let chartColors: [Color] = [
    Color(red: 0.55, green: 0.83 , blue: 0.78),
    Color(red: 1.00, green: 1.00 , blue: 0.70),
    Color(red: 0.75, green: 0.73 , blue: 0.85),
    Color(red: 0.98, green: 0.50 , blue: 0.45),
    Color(red: 0.50, green: 0.69 , blue: 0.83),
    Color(red: 0.99, green: 0.71 , blue: 0.38),
    Color(red: 0.70, green: 0.87 , blue: 0.41),
    Color(red: 0.99, green: 0.80 , blue: 0.90),
    Color(red: 0.85, green: 0.85 , blue: 0.85),
    Color(red: 0.74, green: 0.50 , blue: 0.74),
    Color(red: 0.80, green: 0.92 , blue: 0.77),
    Color(red: 1.00, green: 0.93 , blue: 0.44)
]
