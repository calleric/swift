//
//  WeightViewModel.swift
//  ScrollingChartsApp
//
//  Created by Eric Callanan on 28/11/2022.
//

import Foundation

class WeightViewModel: ObservableObject {
    @Published private var weightModel = WeightData()

    init() {
        weightModel.createWeightData(days: 100)
    }
    
    var allWeights: [Weight]? {
        weightModel.allWeights
    }
    
    func generateWeightData(numberOfDays: Int) {
        weightModel.createWeightData(days: numberOfDays)
    }
}

