//
//  StartRadialGradientView.swift
//  RadialGradientApp
//
//  Created by Eric Callanan on 08/07/2023.
//

import SwiftUI

struct StartRadialGradientView: View {
    var body: some View {
        VStack {
            Text("RadialGradient")
                .font(.largeTitle)
                .fontWeight(.bold)
            Divider()
            
            VStack(spacing: 0) {
                Text("Two colors")
                    .font(.title)
                    .fontWeight(.bold)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        RadialGradient(colors: AppColors.twoColors,
                                       center: .center,
                                       startRadius: 0,
                                       endRadius: 150)
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
                        RadialGradient(colors: AppColors.rainbow,
                                       center: .center,
                                       startRadius: 0,
                                       endRadius: 150)
                    )
                    .frame(width: 300, height: 300)
            }
            
            Spacer()
        }
    }
}

struct StartRadialGradientView_Previews: PreviewProvider {
    static var previews: some View {
        StartRadialGradientView()
    }
}
