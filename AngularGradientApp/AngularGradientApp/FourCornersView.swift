//
//  FourCornersView.swift
//  AngularGradientApp
//
//  Created by Eric Callanan on 10/06/2023.
//

import SwiftUI

struct FourCornersView: View {
    var body: some View {
        VStack {
            Text("Four Corners")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Rectangle()
                .fill(
                    AngularGradient(colors: AppColors.rainbow,
                                    center: .center)
                )
                .frame(width: 300, height: 300)

            VStack(spacing: 40) {
                HStack(spacing: 40) {
                    Rectangle()
                        .fill(
                            AngularGradient(colors: AppColors.rainbow,
                                            center: .bottomTrailing)
                        )
                        .frame(width: 150, height: 150)
                    Rectangle()
                        .fill(
                            AngularGradient(colors: AppColors.rainbow,
                                            center: .bottomLeading)
                        )
                        .frame(width: 150, height: 150)
                }
                HStack(spacing: 40) {
                    Rectangle()
                        .fill(
                            AngularGradient(colors: AppColors.rainbow,
                                            center: .topTrailing)
                        )
                        .frame(width: 150, height: 150)
                    Rectangle()
                        .fill(
                            AngularGradient(colors: AppColors.rainbow,
                                            center: .topLeading)
                        )
                        .frame(width: 150, height: 150)
                }
            }
            .padding()
            Spacer()
        }    
    }
}

struct FourCornersView_Previews: PreviewProvider {
    static var previews: some View {
        FourCornersView()
    }
}
