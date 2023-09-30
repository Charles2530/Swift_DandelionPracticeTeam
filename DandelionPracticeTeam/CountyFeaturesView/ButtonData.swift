//
//  ButtonData.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/30.
//

import SwiftUI
struct ButtonData {
    var title: String
    var imageBinding: String
    var descriptionBinding: String
    var section:SectionData?
    var action: ((Binding<String>,Binding<String>) -> Void)?
    
    init(title: String, imageBinding: String, descriptionBinding: String) {
        self.title = title
        self.imageBinding = imageBinding
        self.descriptionBinding = descriptionBinding
        imageAndDescriptionTable[title] = ImageAndDescription(imageName: imageBinding, description: descriptionBinding)
    }
}









































