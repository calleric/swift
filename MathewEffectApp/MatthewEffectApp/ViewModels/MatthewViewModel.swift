//
//  MatthewViewModel.swift
//  MathewEffectApp
//
//  Created by Eric Callanan on 27/09/2022.
//

import SwiftUI

import Foundation

struct Config {
    static let playerNumber = 500
    static let totalCoin = 10
}


class MatthewViewModel: ObservableObject {
    @Published private(set) var game: MatthewModel
    @Published private(set) var isRunning: Bool
    
    private(set) var allowNegative: Bool
    private(set) var allowAgentsWithZero: Bool
    
    init(allowNegativeCount: Bool = false, allowAgentsWithZero: Bool = true) {
        self.allowNegative = allowNegativeCount
        self.allowAgentsWithZero = allowAgentsWithZero
        self.game = MatthewModel(capacity: Config.playerNumber,
                                 allowNegativeCount: self.allowNegative,
                                 allowAgentsWithZero: self.allowAgentsWithZero)
        self.isRunning = false
    }
    
    var coinStatus: [Coin] {
        var sum: [Coin] = []
        for index in 0...(Config.totalCoin * 7) {
            sum.append(Coin(id: index,
                            coinCount: game.agents.filter{ $0.value.total == index }.count))
        }
        
        return sum
    }
    
    var coinStatusNeg: [Coin] {
        var sum: [Coin] = []
        for index in ((Config.totalCoin + 1) * (-7))...((Config.totalCoin + 1) * 7) {
            sum.append(Coin(id: index,
                            coinCount: game.agents.filter{ $0.value.total == index }.count))
        }
        
        return sum
    }
    
    var maxAgentsWithSameCoinCount: Int {
        let coins = self.coinStatus.map { $0.coinCount }
        return coins.max() ?? 0
    }
    
    var transactionsCount: Int {
        return game.transactionCount
    }
    
    var failedTransactionsCount: Int {
        return game.transactionCount - game.successfulTransactionCount
    }
    
    var agentsWithZero: Int {
        return game.agents.filter{ $0.value.total == 0 }.count
    }
    
    @MainActor
    func performRandomTransactions(number: Int, amount: Int? = nil) async {
        self.isRunning = true
        for _ in 1...number {
            // await game.performTransaction(amount: amount)
            await game.performTransactionSuite(amount: amount)
        }
        self.isRunning = false
    }
    
    func restart() {
        self.game = MatthewModel(capacity: Config.playerNumber,
                                 allowNegativeCount: self.allowNegative,
                                 allowAgentsWithZero: self.allowAgentsWithZero)
    }
}

