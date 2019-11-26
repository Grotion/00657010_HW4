//
//  HomePage.swift
//  00657010_HW4
//
//  Created by Shaun Ku on 2019/11/22.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI

struct FirstPage: View
{
    @ObservedObject var inspectorData = InspectorData()
    var body: some View
    {
        TabView
        {
            Instruction()
            .tabItem
            {
                Image(systemName: "info.circle")
                Text("使用指南")
            }
            InspectorList(inspectorData: self.inspectorData)
            .tabItem
            {
                Image(systemName: "magnifyingglass")
                Text("稽查紀錄")
            }
            Analysis(inspectorData: self.inspectorData)
            .tabItem
            {
                Image(systemName: "map")
                Text("稽查分析")
            }
        }
    }
}

struct FirstPage_Previews: PreviewProvider
{
    static var previews: some View
    {
        FirstPage()
    }
}
