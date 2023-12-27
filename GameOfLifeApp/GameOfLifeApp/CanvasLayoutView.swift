//
//  CanvasLayoutView.swift
//  GameOfLifeApp
//
//  Created by Eric Callanan on 20/12/2023.
//

import SwiftUI

struct CanvasLayoutView: View {
    var body: some View {
        VStack {
            VStack(spacing: 5) {
                Text("Use Canvas")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Canvas { context, size in
                    let w = size.width
                    let h = size.height
                    let rows = 5
                    let cols = 5
                    let offset = 0.03 * w / CGFloat(cols)
                    
                    for r in 0..<rows {
                        for c in 0..<cols {
                            let n = Int.random(in: 1..<10)

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
                                with: .color(n%3 == 0 ? .green : .gray))
                        }
                    }
                }
                .background(.black)
                .frame(width: 300, height: 300)
                .border(Color.black)
            }
            
            Spacer()
                .frame(height: 20)
            
            Divider()
            
            VStack(spacing: 5) {
                Text("Canvas 50 * 50")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Canvas { context, size in
                    let w = size.width
                    let h = size.height
                    let rows = 50
                    let cols = 50
                    let offset = 0.03 * w / CGFloat(cols)
                    
                    for r in 0..<rows {
                        for c in 0..<cols {
                            let n = Int.random(in: 1..<10)

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
                                with: .color(n%9 == 0 ? .green : .gray))
                        }
                    }
                }
                .background(.black)
                .frame(width: 300, height: 300)
                .border(Color.black)
                
                Spacer()
            }
        }
    }
}

#Preview {
    CanvasLayoutView()
}
