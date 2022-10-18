//
//  MatthewModel.swift
//  MathewEffectApp
//
//  Created by Eric Callanan on 27/09/2022.
//

import SwiftUI


struct Agent: Identifiable {
    let id: Int
    var total: Int
}

struct Coin: Identifiable {
    let id: Int
    var coinCount: Int
}

struct MatthewModel {
    private(set) var agents: [Int: Agent]
    private(set) var transactionCount: Int
    private(set) var successfulTransactionCount: Int
    private(set) var allowNegative: Bool
    private(set) var allowAgentsWithZero: Bool

    init(capacity: Int) {
        self.init(capacity: capacity, allowNegativeCount: false, allowAgentsWithZero: true)
    }

    init(capacity: Int, allowNegativeCount: Bool, allowAgentsWithZero: Bool) {
        self.agents = [:]
        for identity in 1...capacity {
            self.agents[identity] = Agent(id: identity, total: Config.totalCoin)
        }
        self.transactionCount = 0
        self.successfulTransactionCount = 0
        self.allowNegative = allowNegativeCount
        self.allowAgentsWithZero = allowAgentsWithZero
    }

    mutating func exchangeCoins(from: Int, to: Int, amount: Int) {
        self.transactionCount += 1
        if self.allowNegative || agents[from]!.total >= amount {
            self.successfulTransactionCount += 1
            agents[from]!.total = agents[from]!.total - amount
            agents[to]!.total = agents[to]!.total + amount
        }
    }
    
    mutating func performTransaction(amount: Int? = nil) async {
        let remainingIndexes = self.allowAgentsWithZero ? agents.map {$0.key} : agents.filter{ $0.value.total > 0 }.map { $0.key }

        if remainingIndexes.count > 1 {
            // pick a random two agents in the game
            let first = remainingIndexes.randomElement()!
            var second = remainingIndexes.randomElement()!
            while second == first {
                second = remainingIndexes.randomElement()!
            }
            
            exchangeCoins(from: first,
                          to: second,
                          amount: (amount == nil) ? Int.random(in: 1...Config.totalCoin) : amount!)
        }
    }
    
    mutating func performTransactionSuite(amount: Int? = nil) async {
        var remainingIndexes = self.allowAgentsWithZero ? agents.map {$0.key} : agents.filter{ $0.value.total > 0 }.map {$0.key}

        if remainingIndexes.count > 1 {
            remainingIndexes.shuffle()
            
            let randomSample = Int.random(in: 1...remainingIndexes.count)
            while remainingIndexes.count > randomSample {
                let first = remainingIndexes.removeLast()
                let second = remainingIndexes.removeLast()
                exchangeCoins(from: first,
                              to: second,
                              amount: (amount == nil) ? Int.random(in: 1...Config.totalCoin) : amount!)
            }
        }
    }
}

