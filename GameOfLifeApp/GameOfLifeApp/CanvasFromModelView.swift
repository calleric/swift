//
//  CanvasFromModelView.swift
//  GameOfLifeApp
//
//  Created by Eric Callanan on 20/12/2023.
//

import SwiftUI

struct CanvasFromModelView: View {
    @Environment(LifeViewModel.self) private var lifeViewModel

    var body: some View {
        let gridData = lifeViewModel.lifeModel.grid
        
        VStack {
            VStack(spacing: 5) {
                Text("Canvas from Model")
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
                .frame(height: 40)
            
            Divider()
            
            VStack(spacing: 5) {
                Text("Values in Model")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Grid(alignment: .center, horizontalSpacing: 2, verticalSpacing: 2) {
                    ForEach(0..<gridData.count, id:\.self) { r in
                        GridRow {
                            ForEach(0..<gridData[r].count,  id:\.self) { c in
                                Rectangle().fill(.quaternary)
                                    .overlay(
                                        Text("\(gridData[r][c])")
                                            .font(.title3)
                                            .fontWeight(.bold)
                                            .foregroundColor(
                                                gridData[r][c] == 1 ?  .primary : .secondary
                                            )
                                    )
                            }
                        }
                    }
                }
                .background(.quaternary)
                .frame(width: 250, height: 250)
                
                Spacer()
            }
            
            Button("Randomise") { lifeViewModel.reset() }
                .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    CanvasFromModelView().environment(LifeViewModel())
}
