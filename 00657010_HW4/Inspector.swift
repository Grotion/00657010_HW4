//
//  Inspector.swift
//  00657010_HW4
//
//  Created by Shaun Ku on 2019/11/22.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import Foundation

struct Inspector: Identifiable, Codable
{
    var id = UUID()
    var isProfile: Bool
    var name: String
    var selectedGender: String
    var age: Int
    var selectedRegion: String
    var score: Int
    var isFavorite: Bool
    var selectedJob: String
    var instagram: String
    var note: String
}
