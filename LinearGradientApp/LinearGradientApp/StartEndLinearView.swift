//
//  StartEndLinearView.swift
//  LinearGradientApp
//
//  Created by Eric Callanan on 23/05/2023.
//

import SwiftUI

struct StartEndLinearView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Start & Stop values")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                VStack(alignment: .trailing) {
                    LinearGradientView(start: .leading,
                                       end: .trailing)
                    LinearGradientView(start: .top,
                                       end: .bottom)
                    LinearGradientView(start: .topLeading,
                                       end: .bottomTrailing)
                    LinearGradientView(start: .topLeading,
                                       end: .trailing)
                    LinearGradientView(start: .topLeading,
                                       end: .center)
                    LinearGradientView(start: .topLeading,
                                       end: .bottom)
                    LinearGradientView(start: .topLeading,
                                       end: .leading)
                    LinearGradientView(start: .top,
                                       end: .center)
                }
                .padding(.horizontal, 50)
                
                Spacer()
            }
        }
    }
}

struct LinearGradientView: View {
    var start: UnitPointType
    var end: UnitPointType

    var body: some View {
        HStack {
            VStack {
                Text("\(start.rawValue)").font(.title2)
                Text("\(end.rawValue)").font(.title2)
            }
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(colors: AppColors.rainbow,
                                   startPoint: start.unitPoint,
                                   endPoint: end.unitPoint)
                )
                .frame(width: 100, height: 100)
        }
    }
}


struct StartEndLinearView_Previews: PreviewProvider {
    static var previews: some View {
        StartEndLinearView()
    }
}

