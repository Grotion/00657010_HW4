//
//  InspectorRecord.swift
//  00657010_HW4
//
//  Created by Shaun Ku on 2019/11/22.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI

struct InspectorList: View
{
    
    @ObservedObject var inspectorData: InspectorData
    @State private var showEditInspector = false
    
    var body: some View
    {
        GeometryReader
        {
            geometry in
            NavigationView
            {
                List
                {
                    ForEach(self.inspectorData.inspectors)
                    {
                        (inspector) in
                        NavigationLink(destination: InspectorEditor(showEditInspector: self.$showEditInspector, inspectorData: self.inspectorData, editInspector: inspector))
                        {
                            InspectorRow(inspector: inspector)
                        }
                    }
                    .onDelete
                    {
                        (indexSet) in
                        self.inspectorData.inspectors.remove(atOffsets: indexSet)
                    }
                }
                .navigationBarTitle("稽查紀錄")
                .navigationBarItems(leading:
                    HStack
                    {
                        EditButton()
                        .padding(.trailing, 20)
                        Button(action:
                        {
                            var count = 0
                            while self.inspectorData.inspectors.count > 0
                            {
                                print("removing data: \(count)")
                                self.inspectorData.inspectors.remove(at: 0)
                                count += 1
                            }
                        },label: {Text("被發現了！")})
                        .foregroundColor(Color.red)
                    },trailing:
                    HStack
                    {
                        Button(action:
                        {
                            var count = 0
                            for inspector in DemoData
                            {
                                print("add data: \(count)")
                                self.inspectorData.inspectors.append(inspector)
                                count += 1
                            }
                            sort(&self.inspectorData.inspectors)
                        },label: {Text("一鍵輸入")})
                        .padding(.trailing, 20)
                        Button(action:{self.showEditInspector = true},
                        label: {Image(systemName: "plus.circle.fill")})
                    }
                    )
                    .sheet(isPresented: self.$showEditInspector)
                    {
                        NavigationView
                        {
                            InspectorEditor(showEditInspector: self.$showEditInspector, inspectorData: self.inspectorData)
                        }
                    
                    }
            }
        }
    }
}

struct InspectorList_Previews: PreviewProvider
{
    static var previews: some View
    {
        InspectorList(inspectorData: InspectorData())
    }
}
