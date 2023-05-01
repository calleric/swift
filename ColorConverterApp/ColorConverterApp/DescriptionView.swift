//
//  DescriptionView.swift
//  ColorConverterApp
//
//  Created by Eric Callanan on 28/04/2023.
//

import SwiftUI

struct DescriptionView: View {
    @State var selectedColor: Color = .blue
    
    var body: some View {
        let color1 = Color(red: 155/255, green: 100/255, blue: 200/255)
        let color2 = Color.purple
        let color3 = Color(hue: 0.76, saturation: 0.70, brightness: 0.8)

        VStack(alignment: .leading) {
            Text("Color Description")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Spacer().frame(height: 50)
            
            ColorView(title: "RGB: (155, 100, 200)", color: color1)
            ColorView(title: "Color.purple", color: color2)
            ColorView(title: "HSB: (0.76, 0.70, 0.80)", color: color3)
            ColorPicker("Select a Color", selection: $selectedColor)
                .frame(width: 250, height: 50)
            ColorView(title: "Selected Color", color: selectedColor)

            Spacer()
        }
        .padding(50)
    }
}

struct ColorView: View {
    var title: String
    var color: Color
    
    var body: some View {
        Text(title)
            .font(.title)
        HStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(width: 200, height: 50)
            VStack(alignment: .leading) {
                Text("description")
                Text("\(color.description)")
                    .fontWeight(.bold)
            }
        }
        Divider()
    }
}


struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}

