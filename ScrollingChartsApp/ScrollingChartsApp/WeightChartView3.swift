//
//  WeightChartView3.swift
//  LineChart2
//
//  Created by Eric Callanan on 28/11/2022.
//

import SwiftUI
import Charts

struct WeightChartView3: View {
    @ObservedObject private var weightVm = WeightViewModel()

    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.17, brightness: 1.0)
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                GroupBox ("Daily weight (pounds)") {
                    if let weights = weightVm.allWeights {
                        ScrollView(.horizontal) {
                            Chart {
                                ForEach(weights) { weight in
                                    LineMark(
                                        x: .value("Week Day", weight.day),
                                        y: .value("Step Count", weight.pounds)
                                    )
                                    .foregroundStyle(ViewConstants.color1)
                                    .accessibilityLabel("\(weight.day.toString())")
                                    .accessibilityValue("\(weight.pounds) pounds")
                                }
                            }
                            .chartYScale(domain: ViewConstants.minYScale...ViewConstants.maxYScale)
                            .chartYAxis() {
                                AxisMarks(position: .leading)
                            }
                            .chartXAxis {
                                AxisMarks(preset: .extended,
                                          position: .bottom,
                                          values: .stride (by: .day)) { value in
                                    if value.as(Date.self)!.isFirstOfMonth() {
                                        AxisGridLine()
                                            .foregroundStyle(.black.opacity(0.5))
                                        let label = "01\n\(value.as(Date.self)!.monthName())"
                                        AxisValueLabel(label).foregroundStyle(.black)
                                    } else {
                                        AxisValueLabel(
                                            format: .dateTime.day(.twoDigits)
                                        )
                                    }
                                }
                            }
                            .frame(width: ViewConstants.dataPointWidth * CGFloat(weights.count))
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
        static let dataPointWidth: CGFloat = 20
    }
}

struct WeightChartView3_Previews: PreviewProvider {
    static var previews: some View {
        WeightChartView3()
    }
}
