//
//  PhotoWallView.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/10/5.
//

import SwiftUI

struct PhotoWallView: View {
    // 图片名称的数组（从Assets获取）
    @State private var images = ["TeamLogo","LvLiangTeam"] // 更改为您的图片名称

    @State private var selectedImage: String? = nil

    var body: some View {
        NavigationView {
            GridView(images: images, selectedImage: $selectedImage)
                .navigationTitle("照片墙")
        }
    }
}
