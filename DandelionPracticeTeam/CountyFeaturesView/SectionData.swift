//
//  SectionData.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/30.
//

import SwiftUI


struct SectionDataView: View {
    var section: SectionData
    
    @State private var selectedImage = "ZhongYangFromSky"
    @State private var descriptionText = "大美中阳。"

    var body: some View {
        VStack(spacing: 20) {
            Image(self.selectedImage)
                .resizable()
                .frame(maxWidth: 300,maxHeight: 200)
            ScrollView {
                VStack {
                    ScrollView {
                        Text(self.descriptionText).padding()
                    }
                    .frame(maxHeight: 150)
                    ForEach(section.buttonSet, id: \.title) { button in
                        Button(button.title) {
                            selectedImage = button.imageBinding
                            descriptionText = button.descriptionBinding
                        }
                        .padding()
                        .frame(width: 250, height: 50)
                        .bold()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }
            }.frame(maxHeight: 300)
        }.frame(maxWidth: 300)
            .padding([.horizontal, .bottom])
            .background(Color.gray.opacity(0.6))
            .cornerRadius(10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct SectionData: Identifiable {
    var id: Int
    var buttonSet: [ButtonData]
}

