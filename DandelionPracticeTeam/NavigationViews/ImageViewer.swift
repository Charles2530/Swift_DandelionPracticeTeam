//
//  ImageView.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/30.
//

import SwiftUI
struct ImageViewer: View {
    var body: some View {
        Image("ErWeiMa") // 请将"yourImageName"替换为您的图片名称
            .resizable()
            .scaledToFit()
            .padding()
    }
}


#if DEBUG
struct ImageViewer_Previews: PreviewProvider {
    static var previews: some View {
        ImageViewer()
    }
}
#endif

