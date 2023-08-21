//
//  GridView.swift
//  TicTacToe
//
//  Created by Eric Callanan on 12/10/2021.
//

import SwiftUI

struct GridView: View {
    @ObservedObject var ticVm: TicViewModel
    
    var body: some View {
        ZStack {
            
            VStack(spacing:3) {
                let n = 3
                ForEach(0..<n, id:\.self) { r in
                    HStack(spacing:3) {
                        ForEach(0..<n, id:\.self) { c in
                            let index = (r*n) + c
                            let cellContent = ticVm.grid[index]
                            
                            Button(action: {
                                // set the cell to X or O
                                ticVm.setCell(index: index,
                                              cellValue: ticVm.isXTurn ? .x : .o)
                            }) {
                                ZStack {
                                    BackGroundCardView()
                                        .padding(2)

                                    Group {
                                        if cellContent == .b {
                                            // leave cell blank
                                        } else if cellContent == .x {
                                            XShape()
                                                .fill(Color(red: 150/255, green: 20/255, blue: 20/255))
                                        } else {
                                            OShape()
                                                .fill(Color(red: 100/255, green: 20/255, blue: 140/255))
                                        }
                                    }
                                    .padding(12)
                                }
                                .frame(width: 80, height: 80)
                            }
                            .disabled(ticVm.isGameOver || cellContent != .b || ticVm.isBoardDisabled) 
                        }
                    }
                }
            }
            
            GridLinesView()
                .foregroundColor(Colors.darkPurple)
                .frame(width: 240, height: 240)
            
            // Winning Lines View
            WinLinesView(winningLines: ticVm.winningLines)
                .foregroundColor(Color.yellow)
                .frame(width: 240, height: 240)
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var ticVm = TicViewModel()
    
    static var previews: some View {
        GridView(ticVm: ticVm)
    }
}


struct GridLinesView: View {
    var body: some View {
        GeometryReader { gr in
            let w = gr.size.width
            let h = gr.size.height
            
            ZStack {
                VStack(spacing:0) {
                    HStack(spacing:0) {
                        Spacer()
                        RoundedRectangle(cornerRadius: w*0.01)
                            .frame(width: w*0.01, height: h*0.98)
                        Spacer()
                        RoundedRectangle(cornerRadius: w*0.01)
                            .frame(width: w*0.01, height: h*0.98)
                        Spacer()
                    }
                }
                HStack(spacing:0) {
                    VStack(spacing:0) {
                        Spacer()
                        RoundedRectangle(cornerRadius: w*0.01)
                            .frame(width: w*0.98, height: h*0.01)
                        Spacer()
                        RoundedRectangle(cornerRadius: w*0.01)
                            .frame(width: w*0.98, height: h*0.01)
                        Spacer()
                    }
                }
            }
        }
    }
}



struct WinLinesView: View {
    var winningLines: [Bool]
    
    var body: some View {
        GeometryReader { gr in
            let size = min(gr.size.width, gr.size.height)
            let pad = size * 0.145
            let thickness = size * 0.05
            let corner = size * 0.1
            let width = gr.size.width * 0.95
            let height = gr.size.height * 0.9

            ZStack {
                // Horizontal Lines
                HStack {
                    Spacer()
                    VStack(spacing:0) {
                        ForEach([0, 1, 2], id: \.self) {
                            Spacer()
                                .frame(height: pad)
                            RoundedRectangle(cornerRadius: corner)
                                .fill(Color(red: 100/255,
                                            green: 255/255,
                                            blue: 140/255,
                                            opacity: winningLines[$0] ? 0.45 : 0.0))
                                .scaleEffect(winningLines[$0] ? 1.0 : 0.1)
                                .animation(.interpolatingSpring(stiffness: 20, damping: 3))
                                .frame(width: width, height: thickness)
                            Spacer()
                                .frame(height: pad)
                        }
                        Spacer()
                    }
                    Spacer()
                }
                // Vertical Lines
                VStack {
                    Spacer()
                    HStack(spacing:0) {
                        ForEach([3, 4, 5], id: \.self) {
                            Spacer()
                                .frame(width: pad)
                            RoundedRectangle(cornerRadius: corner)
                                .fill(Color(red: 100/255,
                                            green: 255/255,
                                            blue: 140/255,
                                            opacity: winningLines[$0] ? 0.45 : 0.0))
                                .scaleEffect(winningLines[$0] ? 1.0 : 0.1)
                                .animation(.interpolatingSpring(stiffness: 20, damping: 3))
                                .frame(width: thickness, height: height)
                            Spacer()
                                .frame(width: pad)
                        }
                        Spacer()
                    }
                    Spacer()
                }

                // Diagonal Lines
                let diagStart = size * 0.1
                let diagEnd = size * 0.9
                Path { path in
                    path.move(to: CGPoint(x: diagStart, y: diagStart))
                    path.addLine(to: CGPoint(x: diagEnd, y: diagEnd))
                }
                .stroke(Color(red: 100/255,
                              green: 255/255,
                              blue: 140/255,
                              opacity: winningLines[6] ? 0.45 : 0.0),
                        style: StrokeStyle(lineWidth: thickness, lineCap: .round))
                .scaleEffect(winningLines[6] ? 1.0 : 0.1)
                .animation(.interpolatingSpring(stiffness: 20, damping: 3))

                Path { path in
                    path.move(to: CGPoint(x: diagStart, y: diagEnd))
                    path.addLine(to: CGPoint(x: diagEnd, y: diagStart))
                }
                .stroke(Color(red: 100/255,
                              green: 255/255,
                              blue: 140/255,
                              opacity: winningLines[7] ? 0.45 : 0.0),
                        style: StrokeStyle(lineWidth: thickness, lineCap: .round))
                .scaleEffect(winningLines[7] ? 1.0 : 0.1)
                .animation(.interpolatingSpring(stiffness: 20, damping: 3))
            }
        }
    }
}

struct BackGroundCardView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 4)
                    .blur(radius: 4)
                    .offset(x: 2, y: 2)
                    .mask(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(
                                    colors: [.black, .clear],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing)))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 8)
                    .blur(radius: 3)
                    .offset(x: -2, y: -2)
                    .mask(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                LinearGradient(
                                    colors: [.clear, .black],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing)))
            )
    }
}


struct AnimatableLine: Shape {
    var startPoint: CGPoint
    var endPoint: CGPoint

    init(startPoint: CGPoint, endPoint: CGPoint) {
        self.startPoint = startPoint
        self.endPoint = endPoint
    }

    var animatableData: AnimatablePair<AnimatablePair<CGFloat, CGFloat>,
                                       AnimatablePair<CGFloat, CGFloat>> {
        get {
            AnimatablePair(AnimatablePair(startPoint.x, startPoint.y),
                           AnimatablePair(endPoint.x, endPoint.y))
        }
        set {
            startPoint.x = newValue.first.first
            startPoint.y = newValue.first.second
            endPoint.x = newValue.second.first
            endPoint.y = newValue.second.second
        }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        return path
    }
}

