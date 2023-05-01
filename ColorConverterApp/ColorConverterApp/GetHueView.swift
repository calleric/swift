//
//  GetHueView.swift
//  ColorConverterApp
//
//  Created by Eric Callanan on 28/04/2023.
//

import SwiftUI

struct GetHueView: View {
    var body: some View {
        let color1 = Color(red: 155/255, green: 100/255, blue: 200/255)
        let color2 = Color.purple
        let color3 = Color(hue: 0.76, saturation: 0.70, brightness: 0.8)
        
        VStack(alignment: .leading) {
            Text("UIColor - getHue")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Spacer().frame(height: 50)
            
            ColorHueView(title: "RGB: (155, 100, 200)", color: color1)
            ColorHueView(title: "Color.purple", color: color2)
            ColorHueView(title: "HSB: (0.76, 0.70, 0.80)", color: color3)
            
            Spacer()
        }
        .padding(40)
    }
}


struct ColorHueView: View {
    var title: String
    var color: Color
    
    func getHsb(_ col: Color) -> (CGFloat, CGFloat, CGFloat, CGFloat) {
        var hue: CGFloat  = 0.0
        var saturation: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        
        let uiColor = UIColor(col)
        uiColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        
        return (hue, saturation, brightness, alpha)
    }
    
    var body: some View {
        let hsb = getHsb(color)
        Text(title)
            .font(.title)
        HStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(width: 200, height: 50)
            VStack(alignment: .trailing) {
                Text("Hue: \(hsb.0, specifier: "%.3F")")
                Text("Saturation: \(hsb.1, specifier: "%.3F")")
                Text("Brightness: \(hsb.2, specifier: "%.3F")")
            }
        }
        Divider()
    }
}



struct GetHueView_Previews: PreviewProvider {
    static var previews: some View {
        GetHueView()
    }
}
