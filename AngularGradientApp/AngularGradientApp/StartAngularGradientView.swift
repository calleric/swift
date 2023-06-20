//
//  StartAngularGradientView.swift
//  AngularGradientApp
//
//  Created by Eric Callanan on 10/06/2023.
//

import SwiftUI

struct StartAngularGradientView: View {
    var body: some View {
        VStack {
            Text("AngularGradient")
                .font(.largeTitle)
                .fontWeight(.bold)
            Divider()
            
            VStack(spacing: 0) {
                Text("Two colors")
                    .font(.title)
                    .fontWeight(.bold)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        AngularGradient(colors: AppColors.twoColors,
                                        center: .center)
                    )
                    .frame(width: 300, height: 300)
            }
            Divider()

            VStack(spacing: 0) {
                Text("Seven colors")
                    .font(.title)
                    .fontWeight(.bold)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        AngularGradient(colors: AppColors.rainbow,
                                        center: .center)
                    )
                    .frame(width: 300, height: 300)
            }
            
            Spacer()
        }
    }
}

struct StartAngularGradientView_Previews: PreviewProvider {
    static var previews: some View {
        StartAngularGradientView()
    }
}
