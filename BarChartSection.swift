///
///  BarChartSection.swift
///  Display the top section of a Bar Chart using yStart, yEnd and chartYScale in SwiftUI Charts
///
///  Xcode version 14.0.1
///  Swift version 5
///
///  Created by Eric Callanan on 23/October/2022.
///
///
/// see more
/// https://swdevnotes.com/swift/2022/display-top-section-of-bar-charts-with-swift-charts/
///


import SwiftUI
import Charts

struct BarChartSection: View {
    var mean: Double {
        return Double(chartData.reduce(0) { $0 + $1.value }) / Double(chartData.count)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                BarTopSectionView()
                    .frame(height: 330)
                
                RectangleMarkTopView()
                    .frame(height: 330)
                
                LineChartTopView()
                    .frame(height: 330)
                
                Spacer()
            }
        }
    }
}

struct BarChartSection_Previews: PreviewProvider {
    static var previews: some View {
        BarChartSection()
    }
}


struct BarTopSectionView: View {
    var mean: Double {
        return Double(chartData.reduce(0) { $0 + $1.value }) / Double(chartData.count)
    }
    let minValue = 40
    let maxValue = 48
    var body: some View {
        GroupBox("Results - top bars - yStart & yEnd") {
            Chart(chartData) { values in
                BarMark(
                    x: .value("name", values.name),
                    yStart:  .value("value", minValue),
                    yEnd: .value("value", values.value)
                )
                .foregroundStyle(Colors.barColor)
                .cornerRadius(5.0)
                .annotation(position: .overlay,
                            alignment: .top) {
                    Text("\(values.value)")
                        .font(.footnote)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .offset(y:30)
                }
                RuleMark(y: .value("mean", mean))
                    .foregroundStyle(Colors.lineColor)
                    .annotation(position: .overlay,
                                alignment: .bottomTrailing,
                                spacing: 5) {
                        VStack {
                            Text("mean")
                            Text("\(String(format: "%.1f", mean))")
                        }
                        .foregroundColor(Colors.lineColor)
                    }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .padding()
            .chartYScale(domain: minValue...maxValue)
        }
        .groupBoxStyle(YellowGroupBoxStyle())
    }
}


struct RectangleMarkTopView: View {
    var mean: Double {
        return Double(chartData.reduce(0) { $0 + $1.value }) / Double(chartData.count)
    }
    let minValue = 40
    let maxValue = 48
    var body: some View {
        VStack {
            GroupBox("Results - RectangleMark") {
                Chart(chartData) { values in
                    RectangleMark(
                        x: .value("name", values.name),
                        yStart:  .value("value", minValue),
                        yEnd: .value("value", values.value)
                    )
                    .foregroundStyle(Colors.barColor)
                    .cornerRadius(5.0)
                    .annotation(position: .overlay,
                                alignment: .top) {
                        Text("\(values.value)")
                            .font(.footnote)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .offset(y:30)
                    }
                    RuleMark(y: .value("mean", mean))
                        .foregroundStyle(Colors.lineColor)
                        .annotation(position: .overlay,
                                    alignment: .bottomTrailing,
                                    spacing: 5) {
                            VStack {
                                Text("mean")
                                Text("\(String(format: "%.1f", mean))")
                            }
                            .foregroundColor(Colors.lineColor)
                        }
                }
                .chartYAxis {
                    AxisMarks(position: .leading)
                }
                .padding()
                .chartYScale(domain: minValue...maxValue)
            }
            .groupBoxStyle(YellowGroupBoxStyle())
        }
    }
}


struct LineChartTopView: View {
    var mean: Double {
        return Double(chartData.reduce(0) { $0 + $1.value }) / Double(chartData.count)
    }
    let minValue = 40
    let maxValue = 48
    var body: some View {
        GroupBox("Results - LineMark") {
            Chart(chartData) { values in
                LineMark(
                    x: .value("name", values.name),
                    y: .value("value", values.value)
                )
                .foregroundStyle(Colors.barColor)
                .symbol(by: .value("data", "value"))
                .symbolSize(150)
                .annotation(position: .overlay,
                            alignment: .top) {
                    Text("\(values.value)")
                        .font(.footnote)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .offset(y:30)
                }
                RuleMark(y: .value("mean", mean))
                    .foregroundStyle(Colors.lineColor)
                    .annotation(position: .overlay,
                                alignment: .bottomTrailing,
                                spacing: 5) {
                        VStack {
                            Text("mean")
                            Text("\(String(format: "%.1f", mean))")
                        }
                        .foregroundColor(Colors.lineColor)
                    }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .chartLegend(.hidden)
            .padding()
            .chartYScale(domain: minValue...maxValue)
        }
        .groupBoxStyle(YellowGroupBoxStyle())
    }
}


struct Data: Identifiable {
    var name: String
    var value: Int
    var id = UUID()
}


let chartData: [Data] = [.init(name: "Square", value: 45),
                         .init(name: "Circle", value: 42),
                         .init(name: "Triangle", value: 46),
                         .init(name: "Hexagon", value: 43)]


struct Colors {
    static let barColor = Color(hue: 0.8, saturation: 0.7, brightness: 0.5)
    static let lineColor = Color(hue: 0.4, saturation: 0.5, brightness: 0.5)
    static let bgPlotColor = Color(hue: 0.12, saturation: 0.10, brightness: 0.92)
    
    static let bgGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(hue: 0.10, saturation: 0.10, brightness: 1.0),
            Color(hue: 0.10, saturation: 0.20, brightness: 0.95)
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}


struct YellowGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .padding(.top, 20)
            .padding(10)
            .background(Colors.bgGradient)
            .cornerRadius(15)
            .shadow(radius: 6.0, x: 6.0, y: 8.0)
            .overlay(
                configuration.label.padding(12),
                alignment: .topLeading
            )
            .padding()
    }
}
