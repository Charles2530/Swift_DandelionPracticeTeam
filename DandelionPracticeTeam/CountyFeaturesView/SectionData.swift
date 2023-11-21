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
    @State private var descriptionText = "\"大美中阳\"，位于中国山西省的吕梁市，中阳县是一片充满自然美景与丰富文化传统的宝地。这里的山川、河流与古老的村庄构成了一幅绝美的画卷。中阳不仅拥有深厚的历史文化底蕴，而且还有着丰富的自然资源。四季分明的气候使得这里的景色各具特色，每个季节都有着不同的魅力。春天的花海、夏天的绿意、秋天的丰收和冬天的雪景，每一处都仿佛是大自然精心打造的艺术品。这里的人们淳朴善良，承载着世代相传的传统文化，使得\"大美中阳\"不仅是一片美景，更是一片充满生活和故事的土地。"

    var body: some View {
        VStack(spacing: 10) {
            Image(self.selectedImage)
                .resizable()
                .frame(maxWidth: 300,maxHeight: 200)
            ScrollView {
                VStack {
                    ScrollView {
                        Text(self.descriptionText)
                        .font(.body)
                        .foregroundColor(.white)  // 文本颜色
                        .multilineTextAlignment(.leading)  // 文本对齐方式
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.gray.opacity(0.7))  // 背景色
                        )
                    }
                    .frame(maxHeight: 240)
                    Spacer()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(section.buttonSet, id: \.title) { button in
                                Button(button.title) {
                                    selectedImage = button.imageBinding
                                    descriptionText = button.descriptionBinding
                                }
                                .padding()
                                .frame(width: 150, height: 50)
                                .bold()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                            }
                        }
                    }
                }
            }.frame(height: 300)
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

