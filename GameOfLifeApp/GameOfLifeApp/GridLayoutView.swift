//
//  GridLayoutView.swift
//  GameOfLifeApp
//
//  Created by Eric Callanan on 20/12/2023.
//

import SwiftUI

struct GridLayoutView: View {
    var body: some View {
        VStack {
            VStack(spacing: 5) {
                Text("Use Grid")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Grid(alignment: .center, horizontalSpacing: 2, verticalSpacing: 2) {
                    ForEach(0..<5) { row in
                        GridRow {
                            ForEach(0..<5) { _ in
                                let n = Int.random(in: 1..<10)
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundStyle(n%3 == 0 ? .green : .gray)
                            }
                        }
                    }
                }
                .padding(5)
                .background(.black)
                .frame(width:300, height: 300)
            }
            
            Spacer()
                .frame(height: 20)
            
            Divider()
            
            VStack(spacing: 5) {
                Text("Grid 50 * 50")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Grid(alignment: .center, horizontalSpacing: 0.1, verticalSpacing: 0.1) {
                    ForEach(0..<50) { row in
                        GridRow {
                            ForEach(0..<50) { _ in
                                let n = Int.random(in: 1..<10)
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundStyle(n%9 == 0 ? .green : .gray)
                            }
                        }
                    }
                }
                .padding(5)
                .background(.black)
                .frame(width:300, height: 300)
                
                Spacer()
            }
        }
    }
}

#Preview {
    GridLayoutView()
}
