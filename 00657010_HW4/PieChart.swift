//
//  PieChart.swift
//  00657010_HW4
//
//  Created by Shaun Ku on 2019/11/24.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import Foundation
import SwiftUI

struct PieChart: Shape
{
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path
    {
        Path
        {
            (path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}
