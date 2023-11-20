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

#if DEBUG
struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(images: ["LvLiangTeam","Wall1","Wall2","Wall3",
                          "Wall4","Wall5","Wall6","Wall7","Wall8","Wall9",
                          "Wall10","Wall11","Wall12","Wall13"], selectedImage: .constant(nil))
    }
}
#endif

