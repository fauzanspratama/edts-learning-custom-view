//
//  StarView.swift
//  edts-learning-custom-view
//
//  Created by Fauzan Sukmapratama on 25/06/25.
//

import SwiftUI

struct Star: Shape {
    let points: Int
    let innerRadius: Double
    let outerRadius: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let angle = .pi * 2 / Double(points * 2)
        
        for i in 0..<points * 2 {
            let radius = i % 2 == 0 ? outerRadius : innerRadius
            let x = center.x + CGFloat(cos(Double(i) * angle - .pi/2)) * CGFloat(radius)
            let y = center.y + CGFloat(sin(Double(i) * angle - .pi/2)) * CGFloat(radius)
            
            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        path.closeSubpath()
        return path
    }
}

// Usage example:
struct StarView: View {
    var body: some View {
        Star(points: 5, innerRadius: 28, outerRadius: 56)
            .fill(.yellow)
            .frame(width: 500, height: 500)
    }
}

#Preview {
    StarView()
}
