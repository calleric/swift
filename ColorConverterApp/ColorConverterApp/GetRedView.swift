//
//  GetRedView.swift
//  ColorConverterApp
//
//  Created by Eric Callanan on 28/04/2023.
//

import SwiftUI

struct GetRedView: View {
    var body: some View {
        let color1 = Color(red: 155/255, green: 100/255, blue: 200/255)
        let color2 = Color.purple
        let color3 = Color(hue: 0.76, saturation: 0.70, brightness: 0.8)

        VStack(alignment: .leading) {
            Text("UIColor - getRed")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Spacer().frame(height: 50)

            ColorRedView(title: "RGB: (155, 100, 200)", color: color1)
            ColorRedView(title: "Color.purple", color: color2)
            ColorRedView(title: "HSB: (0.76, 0.70, 0.80)", color: color3)
            
            Spacer()
        }
        .padding(40)
    }
}


struct ColorRedView: View {
    var title: String
    var color: Color
    
    func getRgb(_ col: Color) -> (CGFloat, CGFloat, CGFloat, CGFloat) {
        var red: CGFloat  = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0

        let uiColor = UIColor(col)
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
    
    var body: some View {
        let rgb = getRgb(color)
        Text(title)
            .font(.title)
        HStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(width: 200, height: 50)
            VStack(alignment: .trailing) {
                Text("Red: \(rgb.0, specifier: "%.3F")")
                Text("Green: \(rgb.1, specifier: "%.3F")")
                Text("Blue: \(rgb.2, specifier: "%.3F")")
            }
        }
        Divider()
    }
}


struct GetRedView_Previews: PreviewProvider {
    static var previews: some View {
        GetRedView()
    }
}
