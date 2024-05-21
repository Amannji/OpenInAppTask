//
//  DashboardShape.swift
//  OpenInAppTask
//
//  Created by Aman Gupta on 21/05/24.
//


import SwiftUI
struct CurvedCornerShape: Shape{
    func path(in rect: CGRect) -> Path {
            let radius: CGFloat = 20

            return Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: rect.width, y: 0))
                path.addLine(to: CGPoint(x: rect.width, y: rect.height - radius))
                path.addArc(center: CGPoint(x: rect.width - radius, y: rect.height - radius),
                            radius: radius,
                            startAngle: .degrees(0),
                            endAngle: .degrees(90),
                            clockwise: false)
                path.addLine(to: CGPoint(x: radius, y: rect.height))
                path.addArc(center: CGPoint(x: radius, y: rect.height - radius),
                            radius: radius,
                            startAngle: .degrees(90),
                            endAngle: .degrees(180),
                            clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: 0))
            }
        }
}
