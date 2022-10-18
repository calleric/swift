//
//  CoinBarChartView.swift
//  MatthewEffectApp
//
//  Created by Eric Callanan on 27/09/2022.
//

import SwiftUI
import Charts

struct CoinBarChartView: View {
    @ObservedObject var mathewGame: MatthewViewModel
    var chartTitle: String
    var displayNegative = false
    var displayFailedTransactionCount = true
    
    @State var isChartVisible = true
    
    var body: some View {
        VStack {
            GroupBox(chartTitle) {
                if self.isChartVisible {
                    BarChart(yMax: mathewGame.maxAgentsWithSameCoinCount)
                } else {
                    Colors.bgGradient
                        .overlay(Text("Chart hidden"))
                }
            }
            .groupBoxStyle(YellowGroupBoxStyle())
            .padding()
            .frame(height: 400)
            
            VStack {
                HStack {
                    Text("Numer of Transactions = ").frame(width: 250, alignment: .trailing)
                    Text("\(mathewGame.transactionsCount)")
                    Spacer()
                }
                if displayFailedTransactionCount {
                    HStack {
                        Text("Failed Transactions = ").frame(width: 250, alignment: .trailing)
                        Text("\(mathewGame.failedTransactionsCount)")
                        Spacer()
                    }
                } else {
                    HStack {
                        Text("Agents with Zero coins = ").frame(width: 250, alignment: .trailing)
                        Text("\(mathewGame.agentsWithZero)")
                        Spacer()
                    }
                }
            }
            
            Button("\(self.isChartVisible ? "Hide Chart" : "Show Chart")") {
                self.isChartVisible.toggle()
            }
            .buttonStyle(ActionButtonStyle())
        }
    }
    
    @ViewBuilder
    func BarChart(yMax: Int) -> some View {
        Chart(self.displayNegative ? mathewGame.coinStatusNeg : mathewGame.coinStatus) {
            BarMark(
                x: .value("number", $0.id),
                y: .value("count", $0.coinCount),
                width: 7
            )
            .foregroundStyle(Colors.barColor)
        }
        .chartPlotStyle { plotArea in
            plotArea
                .background(Colors.bgPlotColor)
        }
        .chartYAxis() {
            AxisMarks(position: .leading)
        }
    }
}

struct CoinBarChartView_Previews: PreviewProvider {
    static var previews: some View {
        CoinBarChartView(mathewGame: MatthewViewModel(),
                         chartTitle: "Test Bar Chart")
    }
}
