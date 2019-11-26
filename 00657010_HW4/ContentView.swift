//
//  ContentView.swift
//  00657010_HW4
//
//  Created by Shaun Ku on 2019/11/22.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI

struct ContentView: View
{
    @State private var width: CGFloat = 0
    var body: some View
    {
        /*HStack
        {
            Rectangle()
            .frame(width: width, height: 20)
            .animation(.linear(duration:  5))
            .onAppear
            {
                self.width = 200
            }
            Spacer()
        }*/
        RingSpinner().padding(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RingSpinner : View {
    @State var pct: Double = 0.0

    var animation: Animation
    {
        Animation.linear(duration: 1.5).repeatForever(autoreverses: false)
    }
    var body: some View
    {
        GeometryReader
        {
            geometry in
            ZStack
            {
                Path
                {
                    path in
                    path.addArc(center: CGPoint(x: geometry.size.width/2, y: geometry.size.width/2), radius: geometry.size.width/2, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: true)
                }
                .stroke(Color.gray, lineWidth: 5)
                InnerRing(pct: self.pct).stroke(Color.yellow, lineWidth: 15)
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .padding(20)
        .onAppear
        {
            withAnimation(self.animation)
            {
                self.pct = 1.0
            }
        }
    }
}

struct InnerRing : Shape
{
    var lagAmmount = 0.5
    var pct: Double

    func path(in rect: CGRect) -> Path
    {

        let end = pct * 360
        let start: Double = 360 * (pct - lagAmmount)
        /*if pct > (1 - lagAmmount)
        {
            start = 360 * (2 * pct - 1.0)
            print("One!")
            print(pct)
            print(start)
        }
        else if pct > lagAmmount
        {
            start = 360 * (pct - lagAmmount)
            print("Two!")
            print(pct)
            print(start)
        }
        else
        {
            start = 0
            print("Three!")
            print(pct)
            print(start)
        }*/
        var p = Path()
        p.addArc(center: CGPoint(x: rect.size.width/2, y: rect.size.width/2), radius: rect.size.width/2, startAngle: Angle(degrees: start), endAngle: Angle(degrees: end), clockwise: false)
        return p
    }
    var animatableData: Double
    {
        get { return pct }
        set { pct = newValue }
    }
}
