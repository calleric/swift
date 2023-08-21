//
//  ActivePlayerView.swift
//  TicTacToe
//
//  Created by Eric Callanan on 14/10/2021.
//

import SwiftUI

struct ActivePlayerView: View {
    var isActive: Bool
    var player: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(isActive ? Colors.activeGradient : Colors.inactiveGradient)
            .frame(width:120, height:30)
            .overlay(
                Text(player))
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .scaleEffect(isActive ? 1.0 : 0.85)
            .animation(.easeInOut(duration: 0.5))
    }
}

struct ActivePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ActivePlayerView(isActive: true, player: "player One")
            ActivePlayerView(isActive: false, player: "player two")
        }
    }
}
