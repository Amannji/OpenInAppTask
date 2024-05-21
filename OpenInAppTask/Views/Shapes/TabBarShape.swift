//
//  TabBarShape.swift
//  OpenInAppTask
//
//  Created by Aman Gupta on 21/05/24.
//

import SwiftUI

struct TabBarShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 20))
            
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 25))
            path.addLine(to: CGPoint(x: rect.width / 2 + 25, y: 25))
            
            path.addQuadCurve(to: CGPoint(x: rect.width / 2 - 50, y: 25),
                                          control: CGPoint(x: rect.width / 2 - 10, y: -25))
            
            path.addLine(to: CGPoint(x: 0, y: 25))
        }
    }
}
