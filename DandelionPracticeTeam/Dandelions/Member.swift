//
//  Member.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/29.
//

import SwiftUI

struct Member {
    let name: String
    let avatar: String
    let introduction: String 
}

struct AvatarView: View {
    let imageName: String
    var size: CGFloat = 100
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: size, height: size)
            .clipShape(Circle())
    }
}
