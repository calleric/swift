//
//  ColorViewModel.swift
//  ColorSelectionHsb
//
//  Created by Eric Callanan on 06/11/2022.
//

import Foundation
import SwiftUI

class ColorViewModel: ObservableObject {
    @Published var colorModel: ColorModel
    
    init() {
        self.colorModel = ColorModel()
    }
    
    var selectedColor: Color {
        colorModel.color
    }
    
    var monochromaticColors: [Color] {
        return colorModel.monochromaticColors
    }
    
    var analogousColors: [Color] {
        return colorModel.analogousColors
    }
    
    var complementaryColors: [Color] {
        return colorModel.complementaryColors
    }

    var triadicColors: [Color] {
        return colorModel.triadicColors
    }
}
