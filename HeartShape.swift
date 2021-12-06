//
//  HeartView.swift
//
//

import SwiftUI

struct HeartView: View {
    var body: some View {
        VStack(spacing:50) {
            HeartShape()
                .fill(Color.red)
                .frame(width: 300, height: 300, alignment: .center)
            
            HStack {
                HeartShape()
                    .fill(Color.red)
                .frame(width: 150, height: 150, alignment: .center)
                HeartShape(cutout: true)
                    .fill(Color.red, style: FillStyle(eoFill: true))
                .frame(width: 150, height: 150, alignment: .center)
            }
            
            Spacer()
        }
    }
}

struct HeartView_Previews: PreviewProvider {
    static var previews: some View {
        HeartView()
    }
}


struct HeartShape: Shape {
    var cutout = false
    
    func path(in rect: CGRect) -> Path {
        let size = min(rect.width, rect.height) * 0.9
        let xOffset = (rect.width > rect.height)
        ? ((rect.width - rect.height) * 0.5) + size * 0.05
        : rect.width  * 0.05
        let yOffset = (rect.height > rect.width)
        ? ((rect.height - rect.width) / 2.0) + size * 0.05
        : rect.width  * 0.05

        func offsetPoint(p: CGPoint) -> CGPoint {
            return CGPoint(x: p.x + xOffset, y: p.y+yOffset)
        }
        var path = Path()

        if cutout {
            path.addPath(Rectangle().path(in: rect))
        }

        path.move(to: offsetPoint(p: (CGPoint(x: (size * 0.50), y: (size * 0.25)))))
        path.addCurve(to: offsetPoint(p: CGPoint(x: 0, y: (size * 0.25))),
                      control1: offsetPoint(p: CGPoint(x: (size * 0.50), y: (-size * 0.10))),
                      control2: offsetPoint(p: CGPoint(x: 0, y: 0)))
        path.addCurve(to: offsetPoint(p: CGPoint(x: (size * 0.50), y: size)),
                      control1: offsetPoint(p: CGPoint(x: 0, y: (size * 0.60))),
                      control2: offsetPoint(p: CGPoint(x: (size * 0.50), y: (size * 0.80))))
        path.addCurve(to: offsetPoint(p: CGPoint(x: size, y: (size * 0.25))),
                      control1: offsetPoint(p: CGPoint(x: (size * 0.50), y: (size * 0.80))),
                      control2: offsetPoint(p: CGPoint(x: size, y: (size * 0.60))))
        path.addCurve(to: offsetPoint(p: CGPoint(x: (size * 0.50), y: (size * 0.25))),
                      control1: offsetPoint(p: CGPoint(x: size, y: 0)),
                      control2: offsetPoint(p: CGPoint(x: (size * 0.50), y: (-size * 0.10))))
        return path
    }
}

