//
//  GridFromArrayView.swift
//  GameOfLifeApp
//
//  Created by Eric Callanan on 20/12/2023.
//

import SwiftUI

struct GridFromArrayView: View {
    
    let gridData = [
        [1,1,0,0,0],
        [0,1,0,1,0],
        [0,0,0,0,1],
        [0,1,0,1,0],
        [0,0,0,1,0]
    ]
    
    var body: some View {
        VStack {
            Text("Grid from 2D array")
                .font(.largeTitle)
                .fontWeight(.bold)
            Grid(alignment: .center, horizontalSpacing: 2, verticalSpacing: 2) {
                ForEach(0..<gridData.count, id:\.self) { r in
                    GridRow {
                        ForEach(0..<gridData[r].count,  id:\.self) { c in
                            Rectangle().fill(gridData[r][c] == 1 ? .green: .gray)
                        }
                    }
                }
            }
            .padding(2)
            .background(.black)
            .frame(width: 300, height: 300)
            
            Spacer()
                .frame(height: 40)
            
            Divider()
            
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

#Preview {
    GridFromArrayView()
}
