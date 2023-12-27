//
//  ThumbView.swift
//  GameOfLifeApp
//
//  Created by Eric Callanan on 20/12/2023.
//

import SwiftUI

struct ThumbView: View {
    @Environment(LifeViewModel.self) private var lifeViewModel
    var gridSize: Int = 50
        
    var body: some View {
        let gridData = lifeViewModel.lifeModel.grid
        
        ZStack {
            Color(hue: 0.58, saturation: 0.17, brightness: 1.0)
                                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack(spacing: 50) {
                    Text("Game of Life")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Canvas { context, size in
                        let w = size.width
                        let h = size.height
                        let rows = gridData.count
                        let cols = gridData[0].count
                        let offset = 0.03 * w / CGFloat(cols)
                        
                        for r in 0..<rows {
                            for c in 0..<cols {
                                let x = w / CGFloat(cols) * CGFloat(c) + offset
                                let y = h / CGFloat(rows) * CGFloat(r) + offset
                                context.fill(
                                    Path(
                                        roundedRect: CGRect(
                                            x: x,
                                            y: y,
                                            width: 0.94 * w / CGFloat(cols),
                                            height: 0.94 * h / CGFloat(rows)
                                        ),
                                        cornerRadius: w/CGFloat(cols*10)),
                                    with: .color(gridData[r][c] == 1 ? .green: .gray))
                            }
                        }
                    }
                    .background(.black)
                    .frame(width: 300, height: 300)
                    .border(Color.black)
                }
                Spacer()
                    .frame(height: 100)
                
                Divider()
                
                VStack {
                    Text("Number of Cycles: \(lifeViewModel.numberOfCycles)")
                        .font(.custom("Helvetica Neue", size: 22, relativeTo: .largeTitle))
                        .fontWeight(.bold)
                }
                
                HStack {
                    Button("Reset") { lifeViewModel.reset(gridSize: self.gridSize) }
                        .buttonStyle(ActionButtonStyle())
                        .disabled(lifeViewModel.isRunning)
                    
                    Button("Step") { lifeViewModel.step() }
                        .buttonStyle(ActionButtonStyle())
                        .disabled(lifeViewModel.isRunning)
                }
                
                HStack {
                    Button("Start") {
                        Task {
                            await lifeViewModel.performNumberOfCycles(number: 1000)
                        }
                    }
                    .buttonStyle(ActionButtonStyle())
                    .disabled(lifeViewModel.isRunning)
                    
                    Button("Stop") {
                        Task {
                            await lifeViewModel.stop()
                        }
                    }
                    .buttonStyle(ActionButtonStyle())
                    .disabled(!lifeViewModel.isRunning)
                    
                    
                }
                
                Spacer()
            }
        }
    }
}


#Preview {
    ThumbView().environment(LifeViewModel())
}
