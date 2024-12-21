//
//  WavyShape.swift
//  Swiggy
//
//  Created by Emmanuel Biju on 21/12/24.
//

import SwiftUI


struct WavyShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let waveHeight: CGFloat = 15
        let waveLength: CGFloat = rect.width / 8
        
        // Bottom waves
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        var x: CGFloat = 0
        while x < rect.width {
            path.addQuadCurve(
                to: CGPoint(x: x + waveLength / 2, y: rect.maxY - waveHeight),
                control: CGPoint(x: x + waveLength / 4, y: rect.maxY)
            )
            path.addQuadCurve(
                to: CGPoint(x: x + waveLength, y: rect.maxY),
                control: CGPoint(x: x + waveLength * 3 / 4, y: rect.maxY - waveHeight)
            )
            x += waveLength
        }
        
        // Right side
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        // Top waves (inverted)
        x = rect.width
        while x > 0 {
            path.addQuadCurve(
                to: CGPoint(x: x - waveLength / 2, y: rect.minY + waveHeight),
                control: CGPoint(x: x - waveLength / 4, y: rect.minY)
            )
            path.addQuadCurve(
                to: CGPoint(x: x - waveLength, y: rect.minY),
                control: CGPoint(x: x - waveLength * 3 / 4, y: rect.minY + waveHeight)
            )
            x -= waveLength
        }
        
        // Close the path
        path.closeSubpath()
        
        return path
    }
}
