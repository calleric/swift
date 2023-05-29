//
//  AllStartEndLinearView.swift
//  LinearGradientApp
//
//  Created by Eric Callanan on 23/05/2023.
//

import SwiftUI

struct AllStartEndLinearView: View {
    var body: some View {
        ScrollView([.vertical, .horizontal]) {
            HStack {
                VStack{
                    Rectangle()
                        .fill(.black)
                        .frame(width: 150, height: 5)
                        .rotationEffect(Angle(degrees: 30))
                        .overlay(
                            Text("StartPoint")
                                .fontWeight(.bold)
                                .offset(x:40, y: -20)
                        )
                        .overlay(
                            Text("EndPoint")
                                .fontWeight(.bold)
                                .offset(x:-40, y: 20)
                        )
                    ForEach(UnitPointType.allCases, id: \.self) { endinging in
                        Text("\(endinging.rawValue)")
                            .font(.footnote)
                            .frame(width: 120, height: 90)
                    }
                }
                
                ForEach(UnitPointType.allCases, id: \.self) { starting in
                    VStack{
                        Text("\(starting.rawValue)")
                            .font(.footnote)
                            .frame(height: 50)
                        ForEach(UnitPointType.allCases, id: \.self) { endinging in
                            LinearGradientView2(start: starting,
                                                end: endinging)
                            .frame(width: 90, height: 90)
                        }
                    }
                }                
            }
        }
    }
}

struct AllStartEndLinearView_Previews: PreviewProvider {
    static var previews: some View {
        AllStartEndLinearView()
    }
}

struct LinearGradientView2: View {
    var start: UnitPointType
    var end: UnitPointType
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(
                LinearGradient(colors: AppColors.rainbow,
                               startPoint: start.unitPoint,
                               endPoint: end.unitPoint)
            )
    }
}
