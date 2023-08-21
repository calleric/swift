//
//  TicTacToeView.swift
//  TicTacToe
//
//  Created by Eric Callanan on 06/10/2021.
//

import SwiftUI

struct TicTacToeView: View {
    @ObservedObject private var ticVm: TicViewModel
    
    init() {
        ticVm = TicViewModel()
    }
    
    var body: some View {
        ZStack {
            Colors.bgGradient
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Tic Tac Toe")
                    .foregroundColor(Colors.darkPurple)
                    .font(.custom("Helvetica Neue", size: 36, relativeTo: .largeTitle))
                    .fontWeight(.bold)
                
                HStack {
                    ActivePlayerView(
                        isActive: ticVm.isXTurn && !ticVm.isGameOver,
                        player: "Player X")

                    ActivePlayerView(
                        isActive: !ticVm.isXTurn && !ticVm.isGameOver,
                        player: "Player O")
                }
                
                GridView(ticVm: ticVm)
                
                
                Spacer().frame(height:50)

                Button("New Two Player Game") {
                    ticVm.reset(twoPlayer: true)
                }
                .buttonStyle(ActionButtonStyle())

                Button("New One Player Game") {
                    ticVm.reset(twoPlayer: false)
                }
                .buttonStyle(ActionButtonStyle())

                if ticVm.isGameOver {
                    Text("GAME OVER !")
                        .foregroundColor(Colors.darkPurple)
                        .font(.custom("Helvetica Neue", size: 36, relativeTo: .largeTitle))
                        .fontWeight(.bold)

                    Text(ticVm.winnerDisplay)
                        .foregroundColor(Colors.darkPurple)
                        .font(.custom("Helvetica Neue", size: 46, relativeTo: .largeTitle))
                        .fontWeight(.bold)
                }

                Spacer()
            }
        }
    }
}

struct TicTacToeView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeView()
    }
}






struct Colors {
    static let bgGradient = LinearGradient(
        gradient: Gradient(
            colors: [
                Color(red: 230/255, green: 230/255, blue: 230/255),
                Color(red: 160/255, green: 160/255, blue: 230/255),
                Color(red: 160/255, green: 160/255, blue: 230/255),
            ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    static let activeGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 206/255, green: 7/255, blue: 85/255),
            Color(red: 112/255, green: 3/255, blue: 49/255)]),
        startPoint: .center,
        endPoint: .bottomTrailing)
    
    static let inactiveGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 80/255, green: 80/255, blue: 100/255, opacity: 0.6),
            Color(red: 80/255, green: 80/255, blue: 100/255, opacity: 0.6)]),
//            Color(red: 120/255, green: 140/255, blue: 180/255)]),
        startPoint: .top,
        endPoint: .bottom)
    
    static let buttonGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 100/255, green: 40/255, blue: 100/255),
            Color(red: 70/255, green: 30/255, blue: 80/255)]),
        startPoint: .top,
        endPoint: .bottom)
    
//    static let mainText = Color(red: 16/255, green: 0, blue: 49/255)
    static let darkPurple = Color(red: 42/255, green: 24/255, blue: 81/255)
}



struct ActionButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .padding(.horizontal, 30)
            .padding(7)
            .background(Colors.buttonGradient)
            .cornerRadius(25)
            .shadow(color: isEnabled ? .black : .clear, radius:2, x:3.0, y:3.0)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
