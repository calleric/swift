//
//  GrayPencilView.swift
//  ColorPencilsApp
//
//  Created by Eric Callanan on 11/05/2023.
//

import SwiftUI

struct GrayPencilView: View {
    var body: some View {
        VStack {
            Text("Gray Pencil")
                .font(.largeTitle)
            
            ZStack {
                PencilTipShape()
                    .fill(.gray)
                PencilTimberShape()
                    .fill(.orange.opacity(0.3))
                PencilBodyShape()
                    .fill(.red.opacity(0.9))
            }
            .frame(width: 100, height: 400)
        }
    }
}

struct GrayPencilView_Previews: PreviewProvider {
    static var previews: some View {
        GrayPencilView()
    }
}



struct PencilTipShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = Path { path in
            path.move(to: CGPoint(x: 0.470 * rect.maxX, y: 0.035 * rect.maxY))
            path.addLine(to: CGPoint(x: 0.530 * rect.maxX, y: 0.020 * rect.maxY))
            path.addLine(to: CGPoint(x: 0.670 * rect.maxX, y: 0.106 * rect.maxY))
            path.addCurve(to: CGPoint(x: 0.330 * rect.maxX, y: 0.106 * rect.maxY),
                          control1: CGPoint(x: 0.580 * rect.maxX, y: 0.120 * rect.maxY),
                          control2: CGPoint(x: 0.420 * rect.maxX, y: 0.120 * rect.maxY))
            path.closeSubpath()
        }
        return path
    }
}

struct PencilTimberShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = Path { path in
            path.move(to: CGPoint(x: 0.330 * rect.maxX, y: 0.106 * rect.maxY))
            path.addCurve(to: CGPoint(x: 0.670 * rect.maxX, y: 0.106 * rect.maxY),
                          control1: CGPoint(x: 0.420 * rect.maxX, y: 0.120 * rect.maxY),
                          control2: CGPoint(x: 0.580 * rect.maxX, y: 0.120 * rect.maxY))
            path.addLine(to: CGPoint(x: 0.980 * rect.maxX, y: 0.270 * rect.maxY))
            path.addCurve(to: CGPoint(x: 0.020 * rect.maxX, y: 0.270 * rect.maxY),
                          control1: CGPoint(x: 0.700 * rect.maxX, y: 0.320 * rect.maxY),
                          control2: CGPoint(x: 0.300 * rect.maxX, y: 0.320 * rect.maxY))
            path.closeSubpath()
        }
        return path
    }
}

struct PencilBodyShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = Path { path in
            path.move(to: CGPoint(x: 0.020 * rect.maxX, y: 0.270 * rect.maxY))
            path.addCurve(to: CGPoint(x: 0.980 * rect.maxX, y: 0.270 * rect.maxY),
                          control1: CGPoint(x: 0.300 * rect.maxX, y: 0.320 * rect.maxY),
                          control2: CGPoint(x: 0.700 * rect.maxX, y: 0.320 * rect.maxY))
            path.addLine(to: CGPoint(x: 0.980 * rect.maxX, y: 0.900 * rect.maxY))
            path.addCurve(to: CGPoint(x: 0.020 * rect.maxX, y: 0.900 * rect.maxY),
                          control1: CGPoint(x: 0.700 * rect.maxX, y: 0.950 * rect.maxY),
                          control2: CGPoint(x: 0.300 * rect.maxX, y: 0.950 * rect.maxY))
            path.closeSubpath()
        }
        return path
    }
}
