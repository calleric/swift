//
//  Utilities.swift
//  LinearGradientApp
//
//  Created by Eric Callanan on 23/05/2023.
//

import SwiftUI


struct AppColors {
    static let twoColors = [Color.blue, .yellow]

    static let rainbow = [
        Color.red,
        .orange,
        .yellow,
        .green,
        .blue,
        Color(hue: 0.773, saturation: 1.0, brightness: 0.51),
        Color(hue: 0.771, saturation: 1.0, brightness: 1.00)
    ]
}


enum UnitPointType: String, CaseIterable {
    case topLeading = "topLeading"
    case top = "top"
    case topTrailing = "topTrailing"
    case leading = "leading"
    case center = "center"
    case trailing = "trailing"
    case bottomLeading = "bottomLeading"
    case bottom = "bottom"
    case bottomTrailing = "bottomTrailing"

    var unitPoint: UnitPoint {
        switch self {
        case .topLeading:
            return UnitPoint.topLeading
        case .top:
            return UnitPoint.top
        case .topTrailing:
            return UnitPoint.topTrailing
        case .leading:
            return UnitPoint.leading
        case .center:
            return UnitPoint.center
        case .trailing:
            return UnitPoint.trailing
        case .bottomLeading:
            return UnitPoint.bottomLeading
        case .bottom:
            return UnitPoint.bottom
        case .bottomTrailing:
            return UnitPoint.bottomTrailing
        }
    }
}
