//
//  WeightChartView2.swift
//  LineChart2
//
//  Created by Eric Callanan on 28/11/2022.
//

import SwiftUI
import Charts

struct WeightChartView2: View {
    @ObservedObject private var weightVm = WeightViewModel()

    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.17, brightness: 1.0)
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                GroupBox ("Daily weight (pounds)") {
                    if let weights = weightVm.allWeights {
                        Chart {
                            ForEach(weights) { weight in
                                BarMark(
                                    x: .value("Week Day", weight.day),
                                    y: .value("Step Count", weight.pounds)
                                )
                                .foregroundStyle(ViewConstants.color1)
                                .accessibilityLabel("\(weight.day.toString())")
                                .accessibilityValue("\(weight.pounds) pounds")
                            }
                        }
                        .chartYAxis() {
                            AxisMarks(position: .leading)
                        }
                    }
                }
                .groupBoxStyle(YellowGroupBoxStyle())
                .frame(width: ViewConstants.chartWidth,  height: ViewConstants.chartHeight)
                
                Text("Generate Data")
                    .font(.title2)
                HStack {
                    Button("10") {
                        weightVm.generateWeightData(numberOfDays: 10)
                    }
                    Button("50") {
                        weightVm.generateWeightData(numberOfDays: 50)
                    }
                    Button("100") {
                        weightVm.generateWeightData(numberOfDays: 100)
                    }
                    Button("1000") {
                        weightVm.generateWeightData(numberOfDays: 1000)
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
    
    private struct ViewConstants {
        static let color1 = Color(hue: 0.33, saturation: 0.81, brightness: 0.76)
        static let minYScale = 150
        static let maxYScale = 240
        static let chartWidth: CGFloat = 350
        static let chartHeight: CGFloat = 400
    }
}

struct WeightChartView2_Previews: PreviewProvider {
    static var previews: some View {
        WeightChartView2()
    }
}
