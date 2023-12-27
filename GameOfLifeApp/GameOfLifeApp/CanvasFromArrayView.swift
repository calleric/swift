//
//  CanvasFromArrayView.swift
//  GameOfLifeApp
//
//  Created by Eric Callanan on 20/12/2023.
//

import SwiftUI

struct CanvasFromArrayView: View {
    
    let gridData = [
        [1,1,0,0,0],
        [0,1,0,1,0],
        [0,0,0,0,1],
        [0,1,0,1,0],
        [0,0,0,1,0]
    ]
    
    var body: some View {
        VStack {
            VStack(spacing: 5) {
                Text("Canvas from 2D array")
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
                Text("Values in 2D array")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Grid(alignment: .center, horizontalSpacing: 3, verticalSpacing: 3) {
                    ForEach(0..<gridData.count, id:\.self) { r in
                        GridRow {
                            ForEach(0..<gridData[r].count,  id:\.self) { c in
                                Rectangle().fill(.quaternary)
                                    .overlay(
                                        Text("\(gridData[r][c])")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                    )
                            }
                        }
                    }
                }
                .background(.quaternary)
                .frame(width: 200, height: 200)
                
                Spacer()
            }
        }
    }
}

#Preview {
    CanvasFromArrayView()
}
