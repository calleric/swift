//
//  RunTransactionsView.swift
//  MatthewEffectApp
//
//  Created by Eric Callanan on 27/09/2022.
//

import SwiftUI

struct RunTransactionsView: View {
    @ObservedObject var mathewGame: MatthewViewModel
    @State var numOfTransactions: Int
    var transferAmount: Int? = nil
    
    let repeatOptions = [1, 10, 100, 500, 5000]
    
    var body: some View {
        VStack {
            VStack(spacing: 5) {
                Text("Number of Transactions")
                    .font(.custom("Helvetica Neue", size: 22, relativeTo: .largeTitle))
                    .fontWeight(.bold)
                Picker("", selection: $numOfTransactions) {
                    ForEach(repeatOptions, id: \.self) {
                        Text("\($0)")
                            .fontWeight(.heavy)
                    }
                }
                .pickerStyle(.segmented)
                .background(Color(hue: 0.10, saturation: 0.10, brightness: 0.98))
            }
            .padding(.horizontal, 35)
            
            
            Button("Perform Transactions") {
                Task {
                    await mathewGame.performRandomTransactions(number: numOfTransactions,
                    amount: transferAmount)
                }
            }
            .buttonStyle(ActionButtonStyle())
            .disabled(mathewGame.isRunning)
            
            Spacer().frame(height: 10)
            
            Button("Reset") {
                mathewGame.restart()
            }
            .buttonStyle(ActionButtonStyle())
            .disabled(mathewGame.isRunning)
        }
    }
}


struct RunTransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        RunTransactionsView(mathewGame: MatthewViewModel(),
                            numOfTransactions: 10)
    }
}
