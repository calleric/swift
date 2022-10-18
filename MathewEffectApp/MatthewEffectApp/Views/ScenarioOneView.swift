//
//  ScenarioOneView.swift
//  MathewEffectApp
//
//  Created by Eric Callanan on 27/09/2022.
//

import SwiftUI
import Charts


struct ScenarioOneView: View {
    @ObservedObject var mathewGame = MatthewViewModel()
    
    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.07, brightness: 1.0)
                    .edgesIgnoringSafeArea(.all)
            
            VStack {
                CoinBarChartView(mathewGame: mathewGame,
                                 chartTitle: "1: Exchange of random amounts")
                
                SettingsView(transferAmount: "random 1 to \(Config.totalCoin)",
                             allowPlayWithZero: mathewGame.allowAgentsWithZero,
                             allowNegative: mathewGame.allowNegative)

                RunTransactionsView(mathewGame: mathewGame,
                                    numOfTransactions: 10)

                Spacer()
            }
        }
    }
}


struct ScenarioOneView_Previews: PreviewProvider {
    static var previews: some View {
        ScenarioOneView()
    }
}



