//
//  ShapesView.swift
//  TicTacToe
//
//  Created by Eric Callanan on 13/10/2021.
//

import SwiftUI

struct ShapesView: View {
    var body: some View {
        let size: CGFloat = 20
        VStack(spacing:0) {
            HStack(spacing:0) {
                ForEach(0..<3) { _ in
                    XShape1()
                        .fill(Color.red)
                        .frame(width: size, height: size, alignment: .center)
                }
            }
            
            HStack(spacing:0) {
                ForEach(0..<3) { _ in
                    OShape()
                        .fill(Color.blue)
                        .frame(width: size, height: size, alignment: .center)
                }
            }
            
            Spacer()
        }
    }
}

struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        ShapesView()
    }
}


struct XShape1: Shape {
    func path(in rect: CGRect) -> Path {
        let size = min(rect.width, rect.height)
        let xOffset = (rect.width > rect.height) ? (rect.width - rect.height) / 2.0 : 0.0
        let yOffset = (rect.height > rect.width) ? (rect.height - rect.width) / 2.0 : 0.0
        
        func adjustPoint(x: Double, y:Double) -> CGPoint {
            return CGPoint(x: (x * size) + xOffset, y: (y * size) + yOffset)
        }
        
        let path = Path { path in
            path.move(to: adjustPoint(x: 0.07, y: 0.2))
            path.addCurve(to: adjustPoint(x: 0.42, y: 0.62),
                          control1: adjustPoint(x: 0.4, y: 0.2),
                          control2: adjustPoint(x: 0.5, y: 0.5))
            path.addCurve(to: adjustPoint(x: 0.0, y: 0.95),
                          control1: adjustPoint(x: 0.32, y: 0.72),
                          control2: adjustPoint(x: 0.42, y: 0.62))
            path.addCurve(to: adjustPoint(x: 0.05, y: 1.0),
                          control1: adjustPoint(x: -0.01, y: 1.0),
                          control2: adjustPoint(x: 0.01, y: 1.0))
            path.addCurve(to: adjustPoint(x: 0.5, y: 0.7),
                          control1: adjustPoint(x: 0.2, y: 0.93),
                          control2: adjustPoint(x: 0.5, y: 0.73))
            path.addCurve(to: adjustPoint(x: 0.95, y: 0.88),
                          control1: adjustPoint(x: 0.75, y: 1.0),
                          control2: adjustPoint(x: 0.85, y: 1.01))
            path.addCurve(to: adjustPoint(x: 0.90, y: 0.80),
                          control1: adjustPoint(x: 1.02, y: 0.83),
                          control2: adjustPoint(x: 1.01, y: 0.65))
            path.addCurve(to: adjustPoint(x: 0.57, y: 0.63),
                          control1: adjustPoint(x: 0.8, y: 0.9),
                          control2: adjustPoint(x: 0.7, y: 0.8))
            path.addCurve(to: adjustPoint(x: 0.71, y: 0.05),
                          control1: adjustPoint(x: 0.75, y: 0.40),
                          control2: adjustPoint(x: 0.99, y: 0.05))
            path.addCurve(to: adjustPoint(x: 0.65, y: 0.10),
                          control1: adjustPoint(x: 0.5, y: 0.07),
                          control2: adjustPoint(x: 0.55, y: 0.09))
            path.addCurve(to: adjustPoint(x: 0.53, y: 0.50),
                          control1: adjustPoint(x: 0.85, y: 0.15),
                          control2: adjustPoint(x: 0.63, y: 0.40))
            path.addCurve(to: adjustPoint(x: 0.22, y: 0.10),
                          control1: adjustPoint(x: 0.53, y: 0.40),
                          control2: adjustPoint(x: 0.35, y: 0.10))
            path.addCurve(to: adjustPoint(x: 0.07, y: 0.2),
                          control1: adjustPoint(x: 0.05, y: 0.11),
                          control2: adjustPoint(x: 0.0, y: 0.20))
            path.closeSubpath()
        }
        return path
    }
}


struct XShape: Shape {
    func path(in rect: CGRect) -> Path {
        let size = min(rect.width, rect.height)
        let xOffset = (rect.width > rect.height) ? (rect.width - rect.height) / 2.0 : 0.0
        let yOffset = (rect.height > rect.width) ? (rect.height - rect.width) / 2.0 : 0.0
        
        func offsetPoint(p: CGPoint) -> CGPoint {
            return CGPoint(x: p.x + xOffset, y: p.y+yOffset)
        }
        
        let path = Path { path in
            path.move(to: offsetPoint(p: CGPoint(x: (size * 0.07), y: (size * 0.2))))
            path.addCurve(to: offsetPoint(p: CGPoint(x: (size * 0.42), y: (size * 0.62))),
                          control1: offsetPoint(p: CGPoint(x: (size * 0.4), y: (size * 0.2))),
                          control2: offsetPoint(p: CGPoint(x: (size * 0.5), y: (size * 0.5))))
            path.addCurve(to: offsetPoint(p: CGPoint(x: (size * 0.0), y: (size * 0.95))),
                          control1: offsetPoint(p: CGPoint(x: (size * 0.32), y: (size * 0.72))),
                          control2: offsetPoint(p: CGPoint(x: (size * 0.42), y: (size * 0.62))))
            path.addCurve(to: offsetPoint(p: CGPoint(x: (size * 0.05), y: (size * 1.0))),
                          control1: offsetPoint(p: CGPoint(x: (size * -0.01), y: (size * 1.0))),
                          control2: offsetPoint(p: CGPoint(x: (size * 0.01), y: (size * 1.0))))
            path.addCurve(to: offsetPoint(p: CGPoint(x: (size * 0.5), y: (size * 0.7))),
                          control1: offsetPoint(p: CGPoint(x: (size * 0.2), y: (size * 0.93))),
                          control2: offsetPoint(p: CGPoint(x: (size * 0.5), y: (size * 0.73))))
            path.addCurve(to: offsetPoint(p: CGPoint(x: (size * 0.95), y: (size * 0.88))),
                          control1: offsetPoint(p: CGPoint(x: (size * 0.75), y: (size * 1.0))),
                          control2: offsetPoint(p: CGPoint(x: (size * 0.85), y: (size * 1.01))))
            path.addCurve(to: offsetPoint(p: CGPoint(x: (size * 0.90), y: (size * 0.80))),
                          control1: offsetPoint(p: CGPoint(x: (size * 1.02), y: (size * 0.83))),
                          control2: offsetPoint(p: CGPoint(x: (size * 1.01), y: (size * 0.65))))
            path.addCurve(to: offsetPoint(p: CGPoint(x: (size * 0.57), y: (size * 0.63))),
                          control1: offsetPoint(p: CGPoint(x: (size * 0.8), y: (size * 0.9))),
                          control2: offsetPoint(p: CGPoint(x: (size * 0.7), y: (size * 0.8))))
            path.addCurve(to: offsetPoint(p: CGPoint(x: (size * 0.71), y: (size * 0.05))),
                          control1: offsetPoint(p: CGPoint(x: (size * 0.75), y: (size * 0.40))),
                          control2: offsetPoint(p: CGPoint(x: (size * 0.99), y: (size * 0.05))))
            path.addCurve(to: offsetPoint(p: CGPoint(x: (size * 0.65), y: (size * 0.10))),
                          control1: offsetPoint(p: CGPoint(x: (size * 0.5), y: (size * 0.07))),
                          control2: offsetPoint(p: CGPoint(x: (size * 0.55), y: (size * 0.09))))
            path.addCurve(to: offsetPoint(p: CGPoint(x: (size * 0.53), y: (size * 0.50))),
                          control1: offsetPoint(p: CGPoint(x: (size * 0.85), y: (size * 0.15))),
                          control2: offsetPoint(p: CGPoint(x: (size * 0.63), y: (size * 0.40))))
            path.addCurve(to: offsetPoint(p: CGPoint(x: (size * 0.22), y: (size * 0.10))),
                          control1: offsetPoint(p: CGPoint(x: (size * 0.53), y: (size * 0.40))),
                          control2: offsetPoint(p: CGPoint(x: (size * 0.35), y: (size * 0.10))))
            path.addCurve(to: offsetPoint(p: CGPoint(x: (size * 0.07), y: (size * 0.2))),
                          control1: offsetPoint(p: CGPoint(x: (size * 0.05), y: (size * 0.11))),
                          control2: offsetPoint(p: CGPoint(x: (size * 0.0), y: (size * 0.20))))
            path.closeSubpath()
        }
        return path
    }
}

struct OShape: Shape {
    func path(in rect: CGRect) -> Path {
        let size = min(rect.width, rect.height)
        let xOffset = (rect.width > rect.height) ? (rect.width - rect.height) / 2.0 : 0.0
        let yOffset = (rect.height > rect.width) ? (rect.height - rect.width) / 2.0 : 0.0
        
        func adjustPoint(x: Double, y:Double) -> CGPoint {
            return CGPoint(x: (x * size) + xOffset, y: (y * size) + yOffset)
        }
        
        let path = Path { path in
            path.move(to: adjustPoint(x: 0.62, y: 0.02))
            path.addCurve(to: adjustPoint(x: 0.04, y: 0.52),
                          control1: adjustPoint(x: 0.3, y: 0.02),
                          control2: adjustPoint(x: 0.1, y: 0.22))
            path.addCurve(to: adjustPoint(x: 0.50, y: 0.98),
                          control1: adjustPoint(x: 0.03, y: 0.70),
                          control2: adjustPoint(x: 0.04, y: 0.99))
            path.addCurve(to: adjustPoint(x: 0.75, y: 0.95),
                          control1: adjustPoint(x: 0.50, y: 0.98),
                          control2: adjustPoint(x: 0.65, y: 0.99))
            path.addCurve(to: adjustPoint(x: 0.95, y: 0.63),
                          control1: adjustPoint(x: 0.84, y: 0.90),
                          control2: adjustPoint(x: 0.93, y: 0.78))
            path.addCurve(to: adjustPoint(x: 0.5, y: 0.13),
                          control1: adjustPoint(x: 0.96, y: 0.43),
                          control2: adjustPoint(x: 0.8, y: 0.0))
            path.addCurve(to: adjustPoint(x: 0.4, y: 0.33),
                          control1: adjustPoint(x: 0.4, y: 0.18),
                          control2: adjustPoint(x: 0.35, y: 0.33))
            path.addCurve(to: adjustPoint(x: 0.7, y: 0.84),
                          control1: adjustPoint(x: 0.8, y: -0.10),
                          control2: adjustPoint(x: 0.99, y: 0.70))
            path.addCurve(to: adjustPoint(x: 0.22, y: 0.80),
                          control1: adjustPoint(x: 0.5, y: 0.92),
                          control2: adjustPoint(x: 0.4, y: 0.90))
            path.addCurve(to: adjustPoint(x: 0.30, y: 0.22),
                          control1: adjustPoint(x: -0.05, y: 0.50),
                          control2: adjustPoint(x: 0.30, y: 0.22))
            path.addCurve(to: adjustPoint(x: 0.62, y: 0.02),
                          control1: adjustPoint(x: 0.5, y: 0.05),
                          control2: adjustPoint(x: 0.80, y: 0.06))
            path.closeSubpath()
        }
        return path
    }
}

