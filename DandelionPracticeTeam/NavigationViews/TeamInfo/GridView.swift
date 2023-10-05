//
//  GridView.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/10/5.
//

import SwiftUI

struct GridView: View {
    let images: [String]
    @Binding var selectedImage: String?

    var body: some View {
        let gridWidth = (UIScreen.main.bounds.width - 60) / 2
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem()], spacing: 20) {
                    ForEach(images, id: \.self) { imageName in
                        NavigationLink(destination: ZoomImageView(imageName: imageName)){
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: gridWidth,height: 200)
                                .clipped()
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
        }
    }
}
