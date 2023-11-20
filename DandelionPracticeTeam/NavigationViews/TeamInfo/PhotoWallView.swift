//
//  PhotoWallView.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/10/5.
//

import SwiftUI

struct PhotoWallView: View {
    // 图片名称的数组（从Assets获取）
    @State private var images = ["LvLiangTeam","Wall1","Wall2","Wall3",
                                 "Wall4","Wall5","Wall6","Wall7","Wall8","Wall9",
                                 "Wall10","Wall11","Wall12","Wall13"]

    @State private var selectedImage: String? = nil

    var body: some View {
        NavigationView {
            GridView(images: images, selectedImage: $selectedImage)
                .navigationTitle("照片墙")
        }
    }
}

#if DEBUG
struct PhotoWallView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoWallView()
    }
}
#endif

