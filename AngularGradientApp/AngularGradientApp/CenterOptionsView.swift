//
//  CenterOptionsView.swift
//  AngularGradientApp
//
//  Created by Eric Callanan on 10/06/2023.
//

import SwiftUI

struct CenterOptionsView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("All Center Options")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Divider()
                
                VStack(alignment: .trailing) {
                    ForEach(UnitPointType.allCases, id: \.self) { endinging in
                        AngularGradientView(center: endinging)
                    }
                }
            }
        }
    }
}

struct CenterOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        CenterOptionsView()
    }
}

struct AngularGradientView: View {
    var center: UnitPointType

    var body: some View {
        HStack {
            VStack {
                Text("\(center.rawValue)").font(.title2)
            }
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    AngularGradient(colors: AppColors.rainbow,
                                    center: center.unitPoint)
                )
                .frame(width: 100, height: 100)
        }
    }
}
