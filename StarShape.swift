//
//  StarView.swift
//
//

import SwiftUI

struct StarView: View {
    var body: some View {
        VStack(spacing:30) {
            HStack(spacing:30) {
                StarShape(points: 5, cornerRadius: 2, isCutout: false, isCircleOutline: false)
                    .fill(Color.yellow)
                    .frame(width: 150, height: 150, alignment: .center)
                StarShape(points: 5, cornerRadius: 2, isCutout: true, isCircleOutline: false)
                    .fill(Color.blue, style: FillStyle(eoFill: true, antialiased: true))
                    .frame(width: 150, height: 150, alignment: .center)
            }
            HStack(spacing:30) {
                StarShape(points: 5, cornerRadius: 2, isCutout: false, isCircleOutline: false)
                    .stroke(Color.black, lineWidth: 3)
                    .frame(width: 150, height: 150, alignment: .center)
                
                StarShape(points: 5, cornerRadius: 2, isCutout: true, isCircleOutline: true)
                    .fill(Color.blue, style: FillStyle(eoFill: true, antialiased: true))
                    .frame(width: 150, height: 150, alignment: .center)
            }
        }
    }
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        StarView()
    }
}

struct Segment {
    let outerCenter: CGPoint
    let outerAngle: Double
    let outerRadius: Double
    let innerCenter: CGPoint
    let innerAngle: Double
    
    var line: CGPoint {
        get {
            let pt = Cartesian(length: outerRadius, angle: outerStartAngle)
            return CGPoint(x: pt.x + outerCenter.x, y: pt.y + outerCenter.y)
        }
    }
    
    var line2: CGPoint {
        get {
            let pt = Cartesian(length: outerRadius, angle: innerStartAngle)
            return CGPoint(x: pt.x + innerCenter.x, y: pt.y + innerCenter.y)
        }
    }
    
    var outerStartAngle: Double {
        get { self.outerAngle - (Double.pi * (0.45)) }
    }
    var outerEndAngle: Double {
        get { self.outerAngle + (Double.pi * (0.45)) }
    }
    
    var innerStartAngle: Double {
        get { self.innerAngle - (Double.pi * (0.7)) }
    }
    var innerEndAngle: Double {
        get { self.innerAngle + (Double.pi * (0.7)) }
    }
}


func Cartesian(length: Double, angle: Double) -> CGPoint {
    return CGPoint(x: length * cos(angle),
                   y: length * sin(angle))
}


struct StarShape: Shape {
    var points = 5
    var cornerRadius = 3.0
    var isCutout = false
    var isCircleOutline = false
    
    func path(in rect: CGRect) -> Path {
        // centre of the containing rect
        var center = CGPoint(x: rect.width/2.0, y: rect.height/2.0)
        // Adjust center down for odd number of sides less than 8
        if points%2 == 1 && points < 8 && !isCircleOutline {
            center = CGPoint(x: center.x, y: center.y * ((Double(points) * (-0.04)) + 1.3))
        }
        
        // radius of a circle that will fit in the rect with some padding
        let outerRadius = (Double(min(rect.width,rect.height)) / 2.0) * 0.9
        let innerRadius = outerRadius * 0.4
        let offsetAngle = Double.pi * (-0.5)
        
        var starSegments:[Segment] = []
        for i in 0..<(points){
            let angle1 = (2.0 * Double.pi/Double(points)) * Double(i)  + offsetAngle
            let outerPoint = Cartesian(length: outerRadius, angle: angle1)
            let angle2 = (2.0 * Double.pi/Double(points)) * (Double(i) + 0.5)  + offsetAngle
            let innerPoint = Cartesian(length: (innerRadius), angle: (angle2))
            
            let segment = Segment(
                outerCenter: CGPoint(x: outerPoint.x + center.x,
                                     y: outerPoint.y + center.y),
                outerAngle: angle1,
                outerRadius: cornerRadius,
                innerCenter: CGPoint(x: innerPoint.x + center.x,
                                     y: innerPoint.y + center.y),
                innerAngle: angle2)
            starSegments.append(segment)
        }
        
        let path = Path() { path in
            if isCutout {
                if isCircleOutline {
                    path.addPath(Circle().path(in: rect))
                    
                } else {
                    path.addPath(Rectangle().path(in: rect))
                }
            }
            for (n, seg) in starSegments.enumerated() {
                n == 0 ? path.move(to: seg.line) : path.addLine(to: seg.line)
                path.addArc(center: seg.outerCenter,
                            radius: seg.outerRadius,
                            startAngle: Angle(radians: seg.outerStartAngle),
                            endAngle: Angle(radians: seg.outerEndAngle),
                            clockwise: false)
                path.addLine(to: seg.line2)
                path.addArc(center: seg.innerCenter,
                            radius: seg.outerRadius,
                            startAngle: Angle(radians: seg.innerStartAngle),
                            endAngle: Angle(radians: seg.innerEndAngle),
                            clockwise: true)
            }
            path.closeSubpath()
        }
        return path
    }
}
