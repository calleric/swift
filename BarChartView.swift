//
//  BarChartView.swift
//  Display daily step count data comparing two weeks with a bar chart in Swift Charts
//
//  Xcode version 14.0 beta
//  Swift version 5
//
//  Created by Eric Callanan on 11/September/2022.
//
//
// see more
// https://swdevnotes.com/swift/2022/create-a-bar-chart-with-swiftui-charts-in-ios-16/
//

import SwiftUI
import Charts

struct BarChartView: View {
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
        
        let stepData = [
            (period: "Previous Week", data: previousWeek),
            (period: "Current Week", data: currentWeek)
        ]
        
        VStack {
            GroupBox ( "Daily Step Count for two weeks") {
                Chart(stepData, id: \.period) { steps in
                    ForEach(steps.data) {
                        BarMark(
                            x: .value("Week Day", $0.shortDay),
                            y: .value("Step Count", $0.steps)
                        )
                        .foregroundStyle(by: .value("Week", steps.period))
                        .position(by: .value("week", steps.period))
                    }
                }
                .chartYAxis {
                    AxisMarks(position: .leading)
                }
                .chartForegroundStyleScale([
                    "Previous Week" : Color(hue: 0.10, saturation: 0.70, brightness: 0.90),
                    "Current Week": Color(hue: 0.80, saturation: 0.70, brightness: 0.80)
                ])
            }
            .frame(height: 500)
            .groupBoxStyle(YellowGroupBoxStyle())
            
            Spacer()
        }
        .padding()
    }
}


struct TestView8_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}


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
        return  dateFormatter.string(from: weekday)
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
            .background(Color(hue: 0.10, saturation: 0.04, brightness: 1.0))
            .cornerRadius(20)
            .overlay(
                configuration.label.padding(10),
                alignment: .topLeading
            )
    }
}
