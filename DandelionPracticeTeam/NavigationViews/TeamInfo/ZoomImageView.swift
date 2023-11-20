//
//  ZoomImageView.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/10/5.
//

import SwiftUI

struct ZoomImageView: View {
    var imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .navigationBarTitleDisplayMode(.inline)
    }
}
#if DEBUG
struct ZoomImageView_Previews: PreviewProvider {
    static var previews: some View {
        ZoomImageView(imageName: "LvLiangTeam")
    }
}
#endif

