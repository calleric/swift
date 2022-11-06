//
//  ChangeHsbView.swift
//  ColorSelectionHsb
//
//  Created by Eric Callanan on 06/11/2022.
//

import SwiftUI

struct ChangeHsbView: View {
    var body: some View {
        ZStack {
            Color(hue: 0.58, saturation: 0.17, brightness: 1.0)
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                VStack {
                    Text("Colors defined with")
                    Text("Hue, Saturation & Brightness")
                }
                .font(.title)
                .fontWeight(.bold)
                
                HueView()
                    .frame(height:200)
                
                SatView()
                    .frame(height:200)
                
                BrightView()
                    .frame(height:200)
                
                
                Spacer()
            }
            .padding(.horizontal, 150)
        }
    }
}

struct ChangeHsbView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeHsbView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

struct HueView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("1. Hue changes the Color")
                .font(.title2)
            HStack {
                ForEach([0.0, 0.2, 0.4, 0.6, 0.8, 1.0], id: \.self) { myHue in
                    VStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(hue: myHue, saturation: 1.0, brightness: 1.0))
                            .shadow(radius: 3, x:5, y:5)
                        Text("H: \(myHue, specifier: "%0.2F")")
                            .foregroundColor(.red)
                        Text("S: 1.00")
                        Text("B: 1.00")
                    }
                }
            }
        }
        .padding(.vertical, 20)
    }
}


struct SatView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("2. Saturation changes color Intensity")
                .font(.title2)
            
            HStack {
                ForEach([0.0, 0.2, 0.4, 0.6, 0.8, 1.0], id: \.self) { mySat in
                    VStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(hue: 0.75, saturation: mySat, brightness: 1.0))
                            .shadow(radius: 3, x:5, y:5)
                        Text("H: 0.75")
                        Text("S: \(mySat, specifier: "%0.2F")")
                            .foregroundColor(.red)
                        Text("B: 1.00")
                    }
                }
            }
        }
        .padding(.vertical, 20)
    }
}


struct BrightView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("3. Brightness changes whiteness")
                .font(.title2)
            
            HStack {
                ForEach([0.0, 0.2, 0.4, 0.6, 0.8, 1.0], id: \.self) { myBright in
                    VStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(hue: 0.75, saturation: 1.00, brightness: myBright))
                            .shadow(radius: 3, x:5, y:5)
                        Text("H: 0.75")
                        Text("S: 1.00")
                        Text("B: \(myBright, specifier: "%0.2F")")
                            .foregroundColor(.red)
                    }
                }
            }
        }
        .padding(.vertical, 20)
    }
}
