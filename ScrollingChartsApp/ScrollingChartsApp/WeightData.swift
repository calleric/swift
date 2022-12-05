//
//  WeightData.swift
//  ScrollingChartsApp
//
//  Created by Eric Callanan on 28/11/2022.
//

import SwiftUI

struct WeightData {
    private(set) var allWeights: [Weight]?
    
    static let weightInitial = 180
    static let weightInterval = 2
    static let weightMin = 175
    static let weightMax = 200
    
    mutating func createWeightData(days: Int) {
        // Generate sample weight date between 175 and 200 pounds (+ or - 0-3 pounds daily)
        self.allWeights = []
        var selectedWeight = WeightData.weightInitial
        var add = true
        for interval in 0...days {
            switch selectedWeight {
            case (WeightData.weightMax - WeightData.weightInterval + 1)..<Int.max:
                add = false
            case 0..<(WeightData.weightMin + WeightData.weightInterval):
                add = true
            default:
                add = (Int.random(in: 0...4) == 3) ? !add : add
            }
            
            selectedWeight = add ? selectedWeight + Int.random(in: 0...WeightData.weightInterval) : selectedWeight - Int.random(in: 0...WeightData.weightInterval)
            let selectedDate = Calendar.current.date(byAdding: .day, value: (-1 * interval), to: Date())!
            self.allWeights!.append(Weight(date: selectedDate, weight: selectedWeight))
        }
    }
}


struct Weight: Identifiable {
    let id = UUID()
    let day: Date
    let pounds: Int
    
    init(date: Date, weight: Int) {
        self.day = date
        self.pounds = weight
    }
    
    var something: String {
        "XYZ"
    }
}
