//
//  ScenarioTwoView.swift
//  MathewEffectApp
//
//  Created by Eric Callanan on 27/09/2022.
//

import SwiftUI
import Charts

struct ScenarioTwoView: View {
    @ObservedObject var mathewGame = MatthewViewModel()
    
    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.07, brightness: 1.0)
                    .edgesIgnoringSafeArea(.all)
            
            VStack {
                CoinBarChartView(mathewGame: mathewGame,
                                 chartTitle: "2: Exchange of 1 coin")
                
                SettingsView(transferAmount: "1",
                             allowPlayWithZero: mathewGame.allowAgentsWithZero,
                             allowNegative: mathewGame.allowNegative)


                RunTransactionsView(mathewGame: mathewGame,
                                    numOfTransactions: 10,
                                    transferAmount: 1)

                Spacer()
            }
        }
    }
}


struct ScenarioTwoView_Previews: PreviewProvider {
    static var previews: some View {
        ScenarioTwoView()
    }
}
