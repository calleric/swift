//
//  StartLinearGradientView.swift
//  LinearGradientApp
//
//  Created by Eric Callanan on 23/05/2023.
//

import SwiftUI

struct StartLinearGradientView: View {
    var body: some View {
        VStack {
            Text("LinearGradient")
                .font(.largeTitle)
                .fontWeight(.bold)
            Divider()
            
            VStack(spacing: 0) {
                Text("Two colors")
                    .font(.title)
                    .fontWeight(.bold)
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(colors: AppColors.twoColors,
                                       startPoint: .leading,
                                       endPoint: .trailing)
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
                        LinearGradient(colors: AppColors.rainbow,
                                       startPoint: .leading,
                                       endPoint: .trailing)
                    )
                    .frame(width: 300, height: 300)
            }
            
            Spacer()
        }
    }
}

struct StartLinearGradientView_Previews: PreviewProvider {
    static var previews: some View {
        StartLinearGradientView()
    }
}

