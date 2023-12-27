//
//  GameOfLifeView.swift
//  GameOfLifeApp
//
//  Created by Eric Callanan on 20/12/2023.
//

import SwiftUI

struct GameOfLifeView: View {
    @Environment(LifeViewModel.self) private var lifeViewModel
    @State var gridSize: Int
    
    let repeatOptions = [5, 10, 20, 50, 100]
    
    var body: some View {
        let gridData = lifeViewModel.lifeModel.grid
        
        VStack {
            VStack(spacing: 5) {
                Text("Conway's Game of Life")
                    .font(.title)
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
                .frame(width: 350, height: 350)
                .border(Color.black)
            }
            
            Divider()
                .frame(height: 50)

            VStack {
                GroupBox {
                    Text("Grid Size:")
                        .font(.custom("Helvetica Neue", size: 22, relativeTo: .largeTitle))
                        .fontWeight(.bold)
                    
                    
                    Picker("", selection: $gridSize) {
                        ForEach(repeatOptions, id: \.self) {
                            Text("\($0)")
                                .fontWeight(.heavy)
                        }
                    }
                    .onChange(of: gridSize) {
                        lifeViewModel.setGridSize(cellNumber: gridSize)
                    }
                    .pickerStyle(.segmented)
                    .background(Color(hue: 0.10, saturation: 0.10, brightness: 0.98))
                    .disabled(lifeViewModel.isRunning)
                }
                .groupBoxStyle(YellowGroupBoxStyle())
            }
            
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

#Preview {
    GameOfLifeView(gridSize: 10).environment(LifeViewModel())
}
