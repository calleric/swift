//
//  SettingsView.swift
//  MatthewEffectApp
//
//  Created by Eric Callanan on 27/09/2022.
//

import SwiftUI

struct SettingsView: View {
    var transferAmount: String
    var allowPlayWithZero: Bool = true
    var allowNegative: Bool = false
    
    var body: some View {
        VStack(spacing: 5) {
            Text("Scenario Settings")
                .font(.custom("Helvetica Neue", size: 22, relativeTo: .largeTitle))
            .fontWeight(.bold)
            
            Grid() {
                GridRow {
                    Text("Number of Agents:")
                        .frame(width: 250, alignment: .trailing)
                        .gridColumnAlignment(.trailing)
                    
                    Text("\(Config.playerNumber)")
                        .gridColumnAlignment(.leading)
                }
                GridRow {
                    Text("Number of Coins:")
                    Text("\(Config.totalCoin)")
                }
                GridRow {
                    Text("Transfer amount:")
                    Text(transferAmount)
                }
                GridRow {
                    Text("Allow play with zero coin:")
                    Text("\(allowPlayWithZero ? "Yes" : "No")")
                }
                GridRow {
                    Text("Negative coin count allowed:")
                    Text("\(allowNegative ? "Yes" : "No")")
                }
            }
        }
        .padding(10)
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(transferAmount: "1")
    }
}
