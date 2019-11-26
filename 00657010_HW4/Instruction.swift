//
//  Instruction.swift
//  00657010_HW4
//
//  Created by Shaun Ku on 2019/11/23.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI

struct Instruction: View
{
    var body: some View
    {
        GeometryReader
        {
            geometry in
            
            ZStack
            {
                Image("instructionBackground")
                .resizable()
                .scaledToFill()
                .opacity(0.3)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .edgesIgnoringSafeArea(.all)
                ScrollView
                {
                    VStack
                    {
                        appName()
                        .padding(EdgeInsets(top: 30, leading: 0, bottom: 10, trailing: 0))
                        appPic()
                        appGoal()
                        .frame(width:geometry.size.width*0.95)
                        .padding(10)
                        appUsage()
                        .frame(width:geometry.size.width*0.95)
                        .padding(10)
                        Spacer()
                    }
                }
                
            }
        }
    }
}

struct Instruction_Previews: PreviewProvider {
    static var previews: some View {
        Instruction()
    }
}

struct appName: View
{
    var body: some View
    {
        Text("專業稽查員Pro🔎")
        .font(Font.system(size:40))
        .fontWeight(.bold)
        .foregroundColor(Color.blue)
        .multilineTextAlignment(.center)
        .frame(width:320, height:60)
        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.yellow))
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
}

struct appPic: View
{
    var body: some View
    {
        Image("instructionPic")
            .resizable()
            .scaledToFill()
            .frame(width:200, height:200)
    }
}

struct appGoal: View
{
    var body: some View
    {
        VStack
        {
            Text("引言")
            .font(Font.system(size:30))
            .fontWeight(.bold)
            .foregroundColor(Color(red: 129/255, green: 0, blue: 0))
            .multilineTextAlignment(.center)
            Text("是不是常常看到喜歡的明星、藝人、網紅等等，想關注又怕被讓人知道？這款「專業稽查員Pro」讓你記錄下喜歡的人不被別人知道！內含分析系統，能清楚的分析您所喜歡的性別、年齡、地區及職業分布。是一款實用又有趣的App呢！")
            .lineLimit(Int.max)
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 15))
            Text("靈感來源：https://www.youtube.com/watch?v=A1W7CU92MlE")
            .lineLimit(Int.max)
        }
        .frame(height: 240)
        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.some(Color(red: 102/255, green: 1, blue: 230/255))))
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.red, style: StrokeStyle(lineWidth: 5, dash: [5])))
        .padding(10)
    }
}

struct appUsage: View
{
    var body: some View
    {
        VStack
        {
            Text("使用說明")
            .font(Font.system(size:30))
            .fontWeight(.bold)
            .foregroundColor(Color(red: 129/255, green: 0, blue: 0))
            .multilineTextAlignment(.center)
            Text("歡迎使用「專業稽查員Pro」！在頁面下方有三個分頁可以做選擇。此頁為「使用指南」，包含使用方法及說明。第二個分頁為「稽查紀錄」，頁面中左上有兩個按鈕，一個為\"Edit\"能將單一紀錄刪除，另一個為「被發現了！」能將所有的稽查紀錄『全部』刪除，僅能回復上一筆資料。頁面右上方有兩個按鈕，一個為「一鍵輸入」能輸入Demo資料(固定，非隨機)，第二個為藍色十字記號能新增新的稽查紀錄，在新增頁面能輸入稽查對象的基本資料，若選擇加入最愛則會被優先顯示於記錄頁面。在稽查紀錄頁面點選任一紀錄能進行編輯。第三個分頁為「稽查分析」，共有4個分析選項，點選任一分析選項將會於下方顯示不同的分析圖表。祝您使用愉快！！")
            .lineLimit(Int.max)
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 15))
        }
        .frame(height:400)
        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.some(Color(red: 1, green: 1, blue: 153/255))))
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(red: 65/255, green: 105/255, blue: 225/255), style: StrokeStyle(lineWidth: 5, dash: [5])))
        .padding(10)
    }
}

