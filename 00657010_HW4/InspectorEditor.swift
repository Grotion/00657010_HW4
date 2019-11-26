//
//  InspectorEditor.swift
//  00657010_HW4
//
//  Created by Shaun Ku on 2019/11/22.
//  Copyright © 2019 Shaun Ku. All rights reserved.
//

import SwiftUI

struct InspectorEditor: View
{
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var showEditInspector: Bool
    var inspectorData: InspectorData
    @State private var isProfile = false
    @State private var name = ""
    @State private var selectedGender = "男"
    @State private var age: CGFloat = 18
    @State private var selectedRegion = "亞洲"
    @State private var score: CGFloat = 0
    @State private var isFavorite = false
    @State private var selectedJob = "學生"
    @State private var instagram = ""
    @State private var note = ""
    @State private var showNameAlert = false
    var editInspector: Inspector?
    var body: some View
    {
        /*ScrollView(.vertical)
        {
            VStack
            {*/
                Form()
                {
                    profilePic(isProfile: self.$isProfile, selectedGender: self.$selectedGender)
                    //.padding(EdgeInsets(top: 50, leading: 10, bottom: 10, trailing: 50))
                    profileName(name: self.$name)
                    profileGender(selectedGender: self.$selectedGender)
                    profileAge(age: self.$age)
                    //.padding(10)
                    profileRegion(selectedRegion: self.$selectedRegion)
                    profileScore(score: self.$score)
                    //.padding(10)
                    profileFavorite(isFavorite: self.$isFavorite)
                    profileJob(selectedJob: self.$selectedJob)
                    //.padding(10)
                    profileInstagram(instagram: self.$instagram)
                    profileNote(note: self.$note)
                    //.padding(EdgeInsets(top: 10, leading: 10, bottom: 50, trailing: 10))
                    //Spacer()
                }
            //}
        //}
        .navigationBarTitle(editInspector == nil ? "稽查員新發現" : "稽查員更新")
        .navigationBarItems(leading: Button("取消")
        {
            self.presentationMode.wrappedValue.dismiss()
            self.showEditInspector = false
        }
        .foregroundColor(Color.red),trailing: Button("儲存")
        {
            if self.name == ""
            {
                self.showNameAlert = true
            }
            else
            {
                let inspector = Inspector(id: UUID(), isProfile: self.isProfile, name: self.name, selectedGender: self.selectedGender, age: Int(self.age), selectedRegion: self.selectedRegion, score: Int(self.score), isFavorite: self.isFavorite, selectedJob: self.selectedJob, instagram: self.instagram, note: self.note)
                if let editInspector = self.editInspector
                {
                    print("Edit old!")
                    let index = self.inspectorData.inspectors.firstIndex
                    {
                        return $0.id == editInspector.id
                    }!
                    //print(self.inspectorData.inspectors[index])
                    self.inspectorData.inspectors[index] = inspector
                    //print(self.inspectorData.inspectors[index])
                    sort(&self.inspectorData.inspectors)
                }
                else
                {
                    print("Add New!")
                    self.inspectorData.inspectors.append(inspector)
                    sort(&self.inspectorData.inspectors)
                }
                self.presentationMode.wrappedValue.dismiss()
                self.showEditInspector = false
            }
            
        }
        .alert(isPresented: $showNameAlert)
        {
            () -> Alert in
            return Alert(title: Text("錯誤!!"), message: Text("名字不得為空白"))
        })
        .onAppear
        {
            if let editInspector = self.editInspector
            {
                self.isProfile = editInspector.isProfile
                self.name = editInspector.name
                self.selectedGender = editInspector.selectedGender
                self.age = CGFloat(editInspector.age)
                self.selectedRegion = editInspector.selectedRegion
                self.score = CGFloat(editInspector.score)
                self.isFavorite = editInspector.isFavorite
                self.selectedJob = editInspector.selectedJob
                self.instagram = editInspector.instagram
                self.note = editInspector.note
            }
        }
        /*.background(Image("editBackground")
        .resizable()
        .scaledToFill()
        .opacity(0.3)
        .edgesIgnoringSafeArea(.all)
        .clipped())*/
    }
}

struct InspectorEditor_Previews: PreviewProvider
{
    static var previews: some View
    {
        InspectorEditor(showEditInspector: .constant(true), inspectorData: InspectorData())
    }
}

func sort(_ initial: inout [Inspector])
{
    //print("initial.count: \(initial.count)")
    //print("initial: \(initial)")
    var temp: [Inspector] = [Inspector(id: UUID(), isProfile: true, name: "Grotion", selectedGender: "男", age: 9, selectedRegion: "亞洲", score: 0, isFavorite: true, selectedJob: "學生", instagram: "", note: "")]
    var count = 0
    for data in initial
    {
        if data.isFavorite == true
        {
            //print("true:\(count)")
            temp.append(data)
            count += 1
        }
    }
    count = 0
    for data in initial
    {
        if data.isFavorite == false
        {
            //print("false:\(count)")
            temp.append(data)
            count += 1
        }
    }
    //print("temp.count: \(temp.count)")
    //print("temp: \(temp)")
    temp.remove(at: 0)
    //print("temp.count: \(temp.count)")
    //print("temp: \(temp)")
    initial = temp
}


struct profilePic: View
{
    @Binding var isProfile: Bool
    @Binding var selectedGender: String
    var body: some View
    {
        HStack
        {
            VStack
            {
                    Spacer()
                    Toggle("想要一個大頭貼嗎", isOn: $isProfile)
            }
            if isProfile == true
            {
                if selectedGender == "男"
                {
                    Image("boyProfile")
                    .resizable()
                    .scaledToFill()
                    .frame(width:100, height:100)
                    .clipShape(Circle())
                }
                else if selectedGender == "女"
                {
                    Image("girlProfile")
                    .resizable()
                    .scaledToFill()
                    .frame(width:100, height:100)
                    .clipShape(Circle())
                }
                else if selectedGender == "其他"
                {
                    Image("otherProfile")
                    .resizable()
                    .scaledToFill()
                    .frame(width:100, height:100)
                    .clipShape(Circle())
                }
            }
            else
            {
                Image("noProfile")
                .resizable()
                .scaledToFill()
                .frame(width:100, height:100)
                .clipShape(Circle())
            }
        }
    }
}

struct profileName: View
{
    @Binding var name: String
    var body: some View
    {
        HStack
        {
            Text("姓名")
            TextField("姓名", text: $name)
            .frame(width:250)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
            .multilineTextAlignment(.center)
        }
    }
}

struct profileGender: View
{
    @Binding var selectedGender: String
    var genders = ["男", "女", "其他"]
    var body: some View
    {
        Picker(selection: $selectedGender, label: Text("性別"))
        {
            ForEach(genders, id: \.self)
            {
                (gender) in
                Text(gender)
            }
        }
        //.frame(width: 180)
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct profileAge: View
{
    @Binding var age: CGFloat
    var body: some View
    {
        HStack
        {
            Text("年紀: \(Int(age)) 歲 ")
            Slider(value: self.$age, in: 0...150, step: 1, minimumValueLabel: Text("0"), maximumValueLabel: Text("150")){Text("")}
        }
    }
}


struct profileRegion: View
{
    @Binding var selectedRegion: String
    var regions = ["亞洲", "歐洲", "非洲", "北美洲", "南美洲", "澳洲", "南極洲"]
    var body: some View
    {
        Picker(selection: $selectedRegion, label: Text("地區"))
        {
            ForEach(regions, id: \.self)
            {
                (region) in
                Text(region)
            }
        }
        .frame(width:370, height: 50)
        .clipped()
    }
}

struct profileScore: View
{
    @Binding var score: CGFloat
    var body: some View
    {
        HStack
        {
            Text("喜愛程度: \(Int(score)) ")
            Slider(value: self.$score, in: 0...5, step: 1, minimumValueLabel: Image(systemName: "heart"), maximumValueLabel: Image(systemName: "heart.fill")){Text("")}
        }
    }
}

struct profileFavorite: View
{
    @Binding var isFavorite: Bool
    var body: some View
    {
        Toggle("是否加入我的最愛", isOn: $isFavorite)
            .frame(width:300)
    }
}

struct profileJob: View
{
    @Binding var selectedJob: String
    var jobs = ["學生", "藝人", "模特兒", "歌手", "演員", "運動員", "政治人物", "網紅", "其他"]
    var body: some View
    {
        Picker(selection: $selectedJob, label: Text("職業"))
        {
            ForEach(jobs, id: \.self)
            {
                (job) in
                Text(job)
            }
        }
        .frame(width:370, height: 50)
        .clipped()
    }
}

struct profileInstagram: View
{
    @Binding var instagram: String
    var body: some View
    {
        HStack
        {
            Text("Instagram")
            TextField("Instagram", text: $instagram)
            .frame(width:200)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
            .multilineTextAlignment(.center)
        }
    }
}

struct profileNote: View
{
    @Binding var note: String
    var body: some View
    {
        VStack
        {
            HStack
            {
                Text("備註：")
                Spacer()
            }
            TextField("", text: $note)
            .frame(height: 100)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
        }
    }
}
