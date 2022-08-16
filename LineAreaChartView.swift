//
//  ContentView.swift
//  Display step count data with combined line and area chart in SwiftUI Charts
//
//  Xcode version 14.0 beta
//  Swift version 5
//
//  Created by Eric Callanan on 14/August/2022.
//
//
// see more
// https://swdevnotes.com/swift/2022/customise-a-line-chart-with-swiftui-charts-in-ios-16/
//

import SwiftUI
import Charts

struct StepCount: Identifiable {
    let id = UUID()
    let weekday: Date
    let steps: Int
    
    init(day: String, steps: Int) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        self.weekday = formatter.date(from: day) ?? Date.distantPast
        self.steps = steps
    }
    
    var weekdayString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter.string(from: weekday)
    }
    
    var shortDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return  dateFormatter.string(from: weekday)
    }
}


struct YellowGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .padding(.top, 30)
            .padding(20)
            .background(Color(hue: 0.10, saturation: 0.10, brightness: 0.98))
            .cornerRadius(20)
            .overlay(
                configuration.label.padding(10),
                alignment: .topLeading
            )
    }
}


struct LineAreaChartView: View {
    var body: some View {
        
        let previousWeek: [StepCount] = [
            StepCount(day: "20220710", steps: 15800),
            StepCount(day: "20220711", steps: 7300),
            StepCount(day: "20220712", steps: 8200),
            StepCount(day: "20220713", steps: 25600),
            StepCount(day: "20220714", steps: 16100),
            StepCount(day: "20220715", steps: 16500),
            StepCount(day: "20220716", steps: 3200)
        ]
        
        let currentWeek: [StepCount] = [
            StepCount(day: "20220717", steps: 4200),
            StepCount(day: "20220718", steps: 15000),
            StepCount(day: "20220719", steps: 2800),
            StepCount(day: "20220720", steps: 10800),
            StepCount(day: "20220721", steps: 5300),
            StepCount(day: "20220722", steps: 10400),
            StepCount(day: "20220723", steps: 4000)
        ]
        
        let prevColor = Color(hue: 0.69, saturation: 0.19, brightness: 0.79)
        let curColor = Color(hue: 0.33, saturation: 0.81, brightness: 0.76)
        let curGradient = LinearGradient(
            gradient: Gradient (
                colors: [
                    curColor.opacity(0.5),
                    curColor.opacity(0.2),
                    curColor.opacity(0.05),
                ]
            ),
            startPoint: .top,
            endPoint: .bottom
        )
        
        VStack() {
            GroupBox ("Weekly comparison of daily step count") {
                Chart {
                    ForEach(previousWeek) {
                        LineMark(
                            x: .value("Week Day", $0.shortDay),
                            y: .value("Step Count", $0.steps)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(prevColor)
                        .foregroundStyle(by: .value("Week", "Previous Week"))
                        .lineStyle(StrokeStyle(lineWidth: 3, dash: [5, 10]))
                        .symbol() {
                            Rectangle()
                                .fill(prevColor)
                                .frame(width: 8, height: 8)
                        }
                        .symbolSize(30)
                        .accessibilityLabel("\($0.weekdayString)")
                        .accessibilityValue("\($0.steps) Steps")
                    }
                    
                    ForEach(currentWeek) {
                        LineMark(
                            x: .value("Week Day", $0.shortDay),
                            y: .value("Step Count", $0.steps)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(curColor)
                        .foregroundStyle(by: .value("Week", "Current Week"))
                        .lineStyle(StrokeStyle(lineWidth: 3))
                        .symbol() {
                            Circle()
                                .fill(curColor)
                                .frame(width: 10)
                        }
                        .symbolSize(30)
                        .accessibilityLabel("\($0.weekdayString)")
                        .accessibilityValue("\($0.steps) Steps")

                        AreaMark(
                            x: .value("Week Day", $0.shortDay),
                            y: .value("Step Count", $0.steps)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(curGradient)
                        .foregroundStyle(by: .value("Week", "Current Week"))
                    }
                }
                // Set the Y axis scale
                .chartYScale(domain: 0...30000)
                
                .chartForegroundStyleScale([
                    "Current Week" : curColor,
                    "Previous Week": prevColor
                ])
                .chartLegend(position: .overlay, alignment: .top)
                .chartPlotStyle { plotArea in
                    plotArea
                        .background(Color(hue: 0.12, saturation: 0.10, brightness: 0.92))
                }
                .chartYAxis() {
                    AxisMarks(position: .leading)
                }
                .frame(height:400)
            }
            .groupBoxStyle(YellowGroupBoxStyle())
            Spacer()
        }
        .padding()
    }
}

struct LineAreaChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineAreaChartView()
    }
}
