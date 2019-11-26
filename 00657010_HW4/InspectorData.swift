//
//  InspectorData.swift
//  00657010_HW4
//
//  Created by Shaun Ku on 2019/11/22.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import Foundation

class InspectorData: ObservableObject
{
    @Published var inspectors = [Inspector]()
    {
        didSet
        {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(inspectors)
            {
                UserDefaults.standard.set(data, forKey:"inspectors")
            }
        }
    }
    init()
    {
        if let data = UserDefaults.standard.data(forKey: "inspectors")
        {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Inspector].self, from:data)
            {
                inspectors = decodedData
            }
        }
    }
}
