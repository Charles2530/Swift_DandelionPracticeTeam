//
//  ImageAndDescriptionController.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/30.
//

import SwiftUI
struct User {
    var isLogged: Bool
    var showAlert: Bool
    var username: String
    var password: String
    var description: String
    var avatar: Avatar
    init(isLogged: Bool = false, showAlert: Bool = true, username: String = "未登录", password: String = "", description: String = "这里是个人描述", avatar: Avatar = Avatar(id: 1,systemName: "person.crop.circle")) {
        self.isLogged = isLogged
        self.showAlert = showAlert
        self.username = username
        self.password = password
        self.description = description
        self.avatar = avatar
    }
}

struct Avatar: Identifiable {
    let id: Int
    let systemName: String
}

var DataTable: [String: User] = [:]
