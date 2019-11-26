//
//  Analysis.swift
//  00657010_HW4
//
//  Created by Shaun Ku on 2019/11/23.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI

struct Analysis: View
{
    @State private var selectedAnalyzeItem = "性別"
    var analyzeItems = ["性別", "年紀", "地區", "職業"]
    var inspectorData: InspectorData
    var genderAngles: [Angle]
    var ageWidths: [Double]
    var regionHeights: [Double]
    var jobPcts: [Double]
    init(inspectorData: InspectorData)
    {
        self.inspectorData = inspectorData
        var totalCount: Double = 0
        
        var genderCount: [Double] = [0,0,0]
        var ageCount: [Double] = [0,0,0,0,0,0,0,0,0,0,0]
        var regionCount: [Double] = [0,0,0,0,0,0,0]
        var jobCount: [Double] = [0,0,0,0,0,0,0,0,0]
        
        for data in inspectorData.inspectors
        {
            totalCount += 1
            if data.selectedGender == "男"
            {
                genderCount[0] += 1
            }
            else if data.selectedGender == "女"
            {
                genderCount[1] += 1
            }
            else if data.selectedGender == "其他"
            {
                genderCount[2] += 1
            }
            if data.age>=0 && data.age<=9
            {
                ageCount[0] += 1
            }
            else if data.age>=10 && data.age<=19
            {
                ageCount[1] += 1
            }
            else if data.age>=20 && data.age<=29
            {
                ageCount[2] += 1
            }
            else if data.age>=30 && data.age<=39
            {
                ageCount[3] += 1
            }
            else if data.age>=40 && data.age<=49
            {
                ageCount[4] += 1
            }
            else if data.age>=50 && data.age<=59
            {
                ageCount[5] += 1
            }
            else if data.age>=60 && data.age<=69
            {
                ageCount[6] += 1
            }
            else if data.age>=70 && data.age<=79
            {
                ageCount[7] += 1
            }
            else if data.age>=80 && data.age<=89
            {
                ageCount[8] += 1
            }
            else if data.age>=90 && data.age<=99
            {
                ageCount[9] += 1
            }
            else if data.age>=100
            {
                ageCount[10] += 1
            }
            if data.selectedRegion == "亞洲"
            {
                regionCount[0] += 1
            }
            else if data.selectedRegion == "歐洲"
            {
                regionCount[1] += 1
            }
            else if data.selectedRegion == "非洲"
            {
                regionCount[2] += 1
            }
            else if data.selectedRegion == "北美洲"
            {
                regionCount[3] += 1
            }
            else if data.selectedRegion == "南美洲"
            {
                regionCount[4] += 1
            }
            else if data.selectedRegion == "澳洲"
            {
                regionCount[5] += 1
            }
            else if data.selectedRegion == "南極洲"
            {
                regionCount[6] += 1
            }
            let jobs = ["學生", "藝人", "模特兒", "歌手", "演員", "運動員", "政治人物", "網紅", "其他"]
            if data.selectedJob == jobs[0]
            {
                jobCount[0] += 1
            }
            else if data.selectedJob == jobs[1]
            {
                jobCount[1] += 1
            }
            else if data.selectedJob == jobs[2]
            {
                jobCount[2] += 1
            }
            else if data.selectedJob == jobs[3]
            {
                jobCount[3] += 1
            }
            else if data.selectedJob == jobs[4]
            {
                jobCount[4] += 1
            }
            else if data.selectedJob == jobs[5]
            {
                jobCount[5] += 1
            }
            else if data.selectedJob == jobs[6]
            {
                jobCount[6] += 1
            }
            else if data.selectedJob == jobs[7]
            {
                jobCount[7] += 1
            }
            else if data.selectedJob == jobs[8]
            {
                jobCount[8] += 1
            }
        }
        //print("genderCount:\(genderCount)")
        //print("ageCount:\(ageCount)")
        //print("regionCount:\(regionCount)")
        //print("jobCount:\(jobCount)")
        var genderPercentages: [Double] = [0,0,0]
        genderPercentages[0] = genderCount[0] / totalCount
        genderPercentages[1] = genderCount[1] / totalCount
        genderPercentages[2] = genderCount[2] / totalCount
        genderAngles = [Angle]()
        var genderStartDegree: Double = 0
        for genderPercentage in genderPercentages
        {
            genderAngles.append(.degrees(genderStartDegree))
            genderStartDegree += 360 * genderPercentage
        }
        if genderPercentages[2] == 1.0
        {
            genderAngles[0] = .degrees(360)
        }
        //print("genderPercentages:\(genderPercentages)")
        //print("genderAngles:\(genderAngles)")
        var agePercentages: [Double] = [0,0,0,0,0,0,0,0,0,0,0]
        ageWidths = [0,0,0,0,0,0,0,0,0,0,0]
        agePercentages[0] = ageCount[0] / totalCount
        ageWidths[0] = agePercentages[0] * 300
        agePercentages[1] = ageCount[1] / totalCount
        ageWidths[1] = agePercentages[1] * 300
        agePercentages[2] = ageCount[2] / totalCount
        ageWidths[2] = agePercentages[2] * 300
        agePercentages[3] = ageCount[3] / totalCount
        ageWidths[3] = agePercentages[3] * 300
        agePercentages[4] = ageCount[4] / totalCount
        ageWidths[4] = agePercentages[4] * 300
        agePercentages[5] = ageCount[5] / totalCount
        ageWidths[5] = agePercentages[5] * 300
        agePercentages[6] = ageCount[6] / totalCount
        ageWidths[6] = agePercentages[6] * 300
        agePercentages[7] = ageCount[7] / totalCount
        ageWidths[7] = agePercentages[7] * 300
        agePercentages[8] = ageCount[8] / totalCount
        ageWidths[8] = agePercentages[8] * 300
        agePercentages[9] = ageCount[9] / totalCount
        ageWidths[9] = agePercentages[9] * 300
        agePercentages[10] = ageCount[10] / totalCount
        ageWidths[10] = agePercentages[10] * 300
        //print("agePercentages:\(agePercentages)")
        //print("ageWidths:\(ageWidths)")
        var regionPercentages: [Double] = [0,0,0,0,0,0,0]
        regionHeights = [0,0,0,0,0,0,0]
        regionPercentages[0] = regionCount[0] / totalCount
        regionHeights[0] = regionPercentages[0] * 240
        regionPercentages[1] = regionCount[1] / totalCount
        regionHeights[1] = regionPercentages[1] * 240
        regionPercentages[2] = regionCount[2] / totalCount
        regionHeights[2] = regionPercentages[2] * 240
        regionPercentages[3] = regionCount[3] / totalCount
        regionHeights[3] = regionPercentages[3] * 240
        regionPercentages[4] = regionCount[4] / totalCount
        regionHeights[4] = regionPercentages[4] * 240
        regionPercentages[5] = regionCount[5] / totalCount
        regionHeights[5] = regionPercentages[5] * 240
        regionPercentages[6] = regionCount[6] / totalCount
        regionHeights[6] = regionPercentages[6] * 240
        //print("regionPercentages:\(regionPercentages)")
        //print("regionHeights:\(regionHeights)")
        jobPcts = [0,0,0,0,0,0,0,0,0]
        jobPcts[0] = jobCount[0] / totalCount
        jobPcts[1] = jobCount[1] / totalCount
        jobPcts[2] = jobCount[2] / totalCount
        jobPcts[3] = jobCount[3] / totalCount
        jobPcts[4] = jobCount[4] / totalCount
        jobPcts[5] = jobCount[5] / totalCount
        jobPcts[6] = jobCount[6] / totalCount
        jobPcts[7] = jobCount[7] / totalCount
        jobPcts[8] = jobCount[8] / totalCount
        //print("jobPcts:\(jobPcts)")
    }
    var body: some View
    {
        GeometryReader
        {
            geometry in
            ZStack
            {
                Image("analyzeBackground")
                .resizable()
                .scaledToFill()
                .opacity(0.3)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .edgesIgnoringSafeArea(.all)
                VStack
                {
                    Text("請選擇分析項目：")
                    .padding(EdgeInsets(top: 50, leading: 10, bottom: 0, trailing: 10))
                    Picker(selection: self.$selectedAnalyzeItem, label: Text("請選擇分析項目："))
                    {
                        ForEach(self.analyzeItems, id: \.self)
                        {
                            (analyzeItem) in
                            Text(analyzeItem)
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(20)
                    if self.inspectorData.inspectors.count != 0
                    {
                        if self.selectedAnalyzeItem == "性別"
                        {
                            genderPieChart(genderAngles: self.genderAngles)
                        }
                        else if self.selectedAnalyzeItem == "年紀"
                        {
                            ageBarChart(ageWidths: self.ageWidths)
                        }
                        else if self.selectedAnalyzeItem == "地區"
                        {
                            regionBarChart(regionHeights: self.regionHeights)
                        }
                        else if self.selectedAnalyzeItem == "職業"
                        {
                            jobRing(jobPcts: self.jobPcts)
                        }
                    }
                    else
                    {
                        Text("稽查紀錄內無資料")
                        .font(Font.system(size:30))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .frame(width:300, height:270)
                        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.red))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black))
                    }
                }
            }
        }
        
    }
}

struct Analysis_Previews: PreviewProvider
{
    static var previews: some View
    {
        Analysis(inspectorData: InspectorData())
    }
}

struct genderPieChart: View
{
    var genderAngles: [Angle]
    var body: some View
    {
        VStack//(totalHeight:270)
        {
            ZStack//(height:200)
            {
                PieChart(startAngle: genderAngles[0], endAngle: genderAngles[1])
                .fill(Color.blue)
                PieChart(startAngle: genderAngles[1], endAngle: genderAngles[2])
                .fill(Color.red)
                PieChart(startAngle: genderAngles[2], endAngle: genderAngles[0])
                .fill(Color.gray)
            }
            .frame(width: 200, height: 200)
            Spacer()//(height:40)
            .frame(height:40)
            genderIcons()//(height:30)
            /*Form
            {
                boyIcon()
                girlIcon()
                otherIcon()
            }*/
        }
        //.animation(.default)
    }
}

struct genderIcons: View
{
    var body: some View
    {
        HStack
        {
            Path(ellipseIn: CGRect(x: 0, y: 0, width: 30, height: 30))
            .fill(Color.blue)
            Text("男生")
            .padding(EdgeInsets(top: 0, leading: -50, bottom: 0, trailing: 10))
            Path(ellipseIn: CGRect(x: 0, y: 0, width: 30, height: 30))
            .fill(Color.red)
            Text("女生")
            .padding(EdgeInsets(top: 0, leading: -50, bottom: 0, trailing: 10))
            Path(ellipseIn: CGRect(x: 0, y: 0, width: 30, height: 30))
            .fill(Color.gray)
            Text("其他")
            .padding(EdgeInsets(top: 0, leading: -50, bottom: 0, trailing: 10))
        }
        .frame(width:300, height: 30)
    }
}

struct boyIcon: View
{
    var body: some View
    {
        HStack
        {
            Group
            {
                ForEach(0..<8)
                {
                    (size) in
                    Path(ellipseIn: CGRect(x: 0, y: size, width: 30-(size*2), height: 30-(size*2)))
                    .fill(Color.blue)
                }
            }
            .frame(width: 30)
            Text("男生")
            .lineLimit(1)
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 5))
    }
}

struct girlIcon: View
{
    var body: some View
    {
        HStack
        {
            Group
            {
                ForEach(0..<8)
                {
                    (size) in
                    Path(ellipseIn: CGRect(x: 0, y: size, width: 30-(size*2), height: 30-(size*2)))
                    .fill(Color.red)
                }
            }
            .frame(width: 30)
            Text("女生")
            .lineLimit(1)
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 5))
    }
}

struct otherIcon: View
{
    var body: some View
    {
        HStack
        {
            Group
            {
                ForEach(0..<8)
                {
                    (size) in
                    Path(ellipseIn: CGRect(x: 0, y: size, width: 30-(size*2), height: 30-(size*2)))
                    .fill(Color.gray)
                }
            }
            .frame(width: 30)
            Text("其他")
            .lineLimit(1)
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 5))
    }
}

struct ageBarChart: View
{
    var ageWidths: [Double]
    var body: some View
    {
        HStack//(totalHeight:270)
        {
            VStack
            {
                ageText()
                Text("100+")
                .padding(.top, 4)
            }
            .frame(width: 60, height: 270)
            .padding(EdgeInsets(top: 0, leading: -50, bottom: 0, trailing: 0))
            ZStack(alignment: .leading)
            {
                Path
                {
                    (path) in
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLine(to: CGPoint(x: 0, y: 270))
                    path.addLine(to: CGPoint(x: 300, y: 270))
                }
                .stroke(Color.black, lineWidth: 2)
                ageBarGroup(ageWidths: ageWidths)
            }
        }
        .frame(width: 300, height: 270)
    }
}

struct ageText: View
{
    var body: some View
    {
        Group
        {
            Text("0~9 ")
            .padding(.top, 4)
            Text("10~19")
            .padding(.top, 4)
            Text("20~29")
            .padding(.top, 4)
            Text("30~39")
            .padding(.top, 4)
            Text("40~49")
            .padding(.top, 4)
            Text("50~59")
            .padding(.top, 4)
            Text("60~69")
            .padding(.top, 4)
            Text("70~79")
            .padding(.top, 4)
            Text("80~89")
            .padding(.top, 4)
            Text("90~99")
            .padding(.top, 4)
        }
    }
}

struct ageBarGroup: View
{
    var ageWidths: [Double]
    var body: some View
    {
        VStack(alignment: .leading)
        {
            Group
            {
                ageBar(finalWidth: ageWidths[0], r: 1, g: 0, b: 0)
                .offset(x:1.5, y:-30)
                ageBar(finalWidth: ageWidths[1], r: 1, g: 165/255, b: 0)
                    .offset(x:1.5, y:-24)
                ageBar(finalWidth: ageWidths[2], r: 1, g: 1, b: 0)
                    .offset(x:1.5, y:-17)
                ageBar(finalWidth: ageWidths[3], r: 204/255, g: 1, b: 0)
                    .offset(x:1.5, y:-11)
                ageBar(finalWidth: ageWidths[4], r: 0, g: 1, b: 0)
                    .offset(x:1.5, y:-4)
                ageBar(finalWidth: ageWidths[5], r: 0, g: 1, b: 1)
                    .offset(x:1.5, y:2)
                ageBar(finalWidth: ageWidths[6], r: 65/255, g: 105/255, b: 1)
                    .offset(x:1.5, y:9)
                ageBar(finalWidth: ageWidths[7], r: 139/255, g: 0, b: 1)
                    .offset(x:1.5, y:15)
                ageBar(finalWidth: ageWidths[8], r: 1, g: 0, b: 1)
                    .offset(x:1.55, y:22)
                ageBar(finalWidth: ageWidths[9], r: 227/255, g: 0, b: 1)
                    .offset(x:1.5, y:29)
            }
            ageBar(finalWidth: ageWidths[10], r: 1, g: 69/255, b: 0)
                .offset(x:1.5, y:36)
        }
        
    }
}

struct ageBar: View
{
    var finalWidth: Double
    var r: Double
    var g: Double
    var b: Double
    @State private var width: CGFloat = 0
    var body: some View
    {
        Rectangle()
        .fill(Color(red: r, green: g, blue: b))
        .frame(width: width, height: 10)
            .animation(.linear(duration: 1))
        .onAppear
        {
            self.width = CGFloat(self.finalWidth)
        }
    }
}
struct regionBarChart: View
{
    var regionHeights: [Double]
    var body: some View
    {
        HStack(spacing: 16)
        {
            regionBar(regionHeight: self.regionHeights[0], info: "亞洲")
            regionBar(regionHeight: self.regionHeights[1], info: "歐洲")
            regionBar(regionHeight: self.regionHeights[2], info: "非洲")
            regionBar(regionHeight: self.regionHeights[3], info: "美洲")
            regionBar(regionHeight: self.regionHeights[4], info: "南美洲")
            regionBar(regionHeight: self.regionHeights[5], info: "澳洲")
            regionBar(regionHeight: self.regionHeights[6], info: "南極洲")
        }
        .frame(height: 270)
    }
}
struct regionBar: View
{
    var regionHeight: Double
    @State private var height: CGFloat = 0
    var info: String
    var body: some View
    {
        VStack
        {
            ZStack(alignment: .bottom)
            {
                Capsule().frame(width: 30, height: 240)
                .foregroundColor(Color(red: 127/255, green: 1, blue: 212/255))
                Capsule().frame(width: 30, height: height)
                .foregroundColor(Color(red: 42/255, green: 82/255, blue: 190/255))
                .animation(.linear(duration:  1))
                .onAppear
                {
                    self.height = CGFloat(self.regionHeight)
                }
            }
            Text(info)
            .frame(height: 22)
            .padding(.top, 4)
        }
    }
}

struct jobRing: View
{
    var jobPcts: [Double]
    var body: some View
    {
        HStack//(totalHeight:270)
        {
            ZStack
            {
                ringSpinner(lagAmmount: jobPcts[0], r: 1, g: 0, b: 0, radius: 100, duration: (1-jobPcts[0])*5)
                ringSpinner(lagAmmount: jobPcts[1], r: 1, g: 128/255, b: 51/255, radius: 90, duration: (1-jobPcts[1])*5)
                ringSpinner(lagAmmount: jobPcts[2], r: 1, g: 1, b: 153/255, radius: 80, duration: (1-jobPcts[2])*5)
                ringSpinner(lagAmmount: jobPcts[3], r: 166/255, g: 1, b: 204/255, radius: 70, duration: (1-jobPcts[3])*5)
                ringSpinner(lagAmmount: jobPcts[4], r: 0, g: 1, b: 1, radius: 60, duration: (1-jobPcts[4])*5)
                ringSpinner(lagAmmount: jobPcts[5], r: 100/255, g: 149/255, b: 237/255, radius: 50, duration: (1-jobPcts[5])*5)
                ringSpinner(lagAmmount: jobPcts[6], r: 123/255, g: 104/255, b: 238/255, radius: 40, duration: (1-jobPcts[6])*5)
                ringSpinner(lagAmmount: jobPcts[7], r: 75/255, g: 0, b: 128/255, radius: 30, duration: (1-jobPcts[7])*5)
                ringSpinner(lagAmmount: jobPcts[8], r: 230/255, g: 230/255, b: 250/255, radius: 20, duration: (1-jobPcts[8])*5)
            }
            .frame(width: 200, height: 200)
            jobIcons()
        }
    }
}

struct ringSpinner : View
{
    @State var pct: Double = 0.0
    var lagAmmount: Double
    var r: Double
    var g: Double
    var b: Double
    var radius: CGFloat
    var duration: Double
    var animation: Animation
    {
        Animation.linear(duration: duration).repeatForever(autoreverses: false)
    }
    var body: some View
    {
        ZStack
        {
            Path
            {
                (path) in
                let center = CGPoint(x: 100, y: 100)
                path.addArc(center: center, radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: true)
            }
            .stroke(Color.gray, lineWidth: 3)
            .opacity(0.5)
            runningRing(lagAmmount: lagAmmount, pct: self.pct, radius: radius)
            .stroke(Color(red: r, green: g, blue: b), lineWidth: 8)
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear
        {
            withAnimation(self.animation)
            {
                self.pct = 1.0
            }
        }
    }
}

struct runningRing : Shape
{
    var lagAmmount: Double
    var pct: Double
    var radius: CGFloat
    func path(in rect: CGRect) -> Path
    {

        let end = pct * 360
        let start: Double = 360 * (pct - lagAmmount)
        var p = Path()
        let center = CGPoint(x: 100, y: 100)
        p.addArc(center: center, radius: radius, startAngle: Angle(degrees: start), endAngle: Angle(degrees: end), clockwise: false)
        return p
    }
    var animatableData: Double
    {
        get { return pct }
        set { pct = newValue }
    }
}

struct jobIcons: View
{
    var body: some View
    {
        VStack
        {
            Group
            {
                jobIcon(r:1, g: 0, b: 0, info: "學生")
                jobIcon(r:1, g: 128/255, b: 51/255, info: "藝人")
                jobIcon(r:1, g: 1, b: 153/255, info: "模特兒")
                jobIcon(r:166/255, g: 1, b: 204/255, info: "歌手")
                jobIcon(r:0, g: 1, b: 1, info: "演員")
                jobIcon(r:100/255, g: 149/255, b: 237/255, info: "運動員")
                jobIcon(r:123/255, g: 104/255, b: 238/255, info: "政治人物")
                jobIcon(r:75/255, g: 0, b: 128/255, info: "網紅")
                jobIcon(r:230/255, g: 230/255, b: 250/255, info: "其他")
            }
        }
        .frame(width:100, height: 270)
        .padding(.leading, 20)
    }
}

struct jobIcon: View
{
    var r: Double
    var g: Double
    var b: Double
    var info: String
    var body: some View
    {
        HStack(alignment: .center)
        {
            Path(ellipseIn: CGRect(x: 0, y: 0, width: 15, height: 15))
            .fill(Color(red: r, green: g, blue: b))
            Text(info)
            .padding(EdgeInsets(top: -5, leading: -50, bottom: 0, trailing: 0))
        }
        //.padding(.top, -20)
    }
}
