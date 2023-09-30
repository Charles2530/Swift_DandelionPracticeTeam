//
//  UserData.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/30.
//

import SwiftUI
import Combine

class UserData: ObservableObject {
    @Published var isLogged = false
    @Published var username = "未登录"
    @Published var password = ""
    @Published var description = "这里是个人描述"
    @Published var avatar: Image = Image(systemName: "person.crop.circle")
}
