//
//  InspectorRow.swift
//  00657010_HW4
//
//  Created by Shaun Ku on 2019/11/22.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI

struct InspectorRow: View
{
    var inspector: Inspector
    
    var body: some View
    {
        HStack
        {
            if inspector.isFavorite == true
            {
                Image("star")
                .resizable()
                .scaledToFill()
                .frame(width:30, height:30)
            }
            else
            {
                Image("star")
                .resizable()
                .scaledToFill()
                .frame(width:30, height:30)
                .hidden()
            }
            if inspector.isProfile == true
            {
                if inspector.selectedGender == "男"
                {
                    Image("boyProfile")
                    .resizable()
                    .scaledToFill()
                    .frame(width:60, height:60)
                    .clipShape(Circle())
                }
                else if inspector.selectedGender == "女"
                {
                    Image("girlProfile")
                    .resizable()
                    .scaledToFill()
                    .frame(width:60, height:60)
                    .clipShape(Circle())
                }
                else if inspector.selectedGender == "其他"
                {
                    Image("otherProfile")
                    .resizable()
                    .scaledToFill()
                    .frame(width:60, height:60)
                    .clipShape(Circle())
                }
            }
            else
            {
                Image("noProfile")
                .resizable()
                .scaledToFill()
                .frame(width:60, height:60)
                .clipShape(Circle())
            }
            VStack(alignment: .leading)
            {
                Text("\(inspector.name), \(inspector.age)歲, \(inspector.selectedRegion)")
                HStack
                {
                    Text(inspector.selectedJob)
                    if inspector.selectedGender == "男"
                    {
                        Image("MaleSymbol")
                        .resizable()
                        .scaledToFill()
                        .frame(width:20, height:20)
                    }
                    else if inspector.selectedGender == "女"
                    {
                        Image("FemaleSymbol")
                        .resizable()
                        .scaledToFill()
                        .frame(width:20, height:20)
                    }
                    else if inspector.selectedGender == "其他"
                    {
                        Image("QuestionMark")
                        .resizable()
                        .scaledToFill()
                        .frame(width:20, height:20)
                    }
                }
            }
            Spacer()
            /*Image("score")
            .resizable()
            .scaledToFill()
            .frame(width:30, height:30)*/
            Image("score\(inspector.score)")
            .resizable()
            .scaledToFill()
            .frame(width:30, height:30)
        }
    }
}

struct InspectorRow_Previews: PreviewProvider
{
    static var previews: some View
    {
        InspectorRow(inspector: Inspector(id: UUID(), isProfile: true, name: "", selectedGender: "", age: 18, selectedRegion: "", score: 5, isFavorite: true, selectedJob: "", instagram: "", note: ""))
    }
}
