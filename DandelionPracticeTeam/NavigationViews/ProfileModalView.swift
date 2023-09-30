//
//  ProfileModalView.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/30.
//

import SwiftUI

struct ProfileModalView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            VStack {
                if userData.isLogged {
                    VStack {
                        Image(systemName: userData.avatar)
                            .resizable()
                            .frame(width: 100, height: 100)
                        
                        Text(userData.username)
                        NavigationLink(destination: ProfileEditView()) {
                            Text("编辑个人资料")
                        }
                        .padding()
                        NavigationLink(destination: FavoritesView()) {
                            Text("我的收藏")
                        }
                        Button("退出登录") {
                            userData.isLogged = false
                            userData.username = "未登录"
                            userData.password = ""
                            userData.description = "这里是个人描述"
                            userData.showAlert = true
                        }
                        .padding()
                    }
                } else {
                    NavigationLink(destination: LoginView()) {
                        Text("登录/注册")
                    }.environmentObject(UserData())
                }
            }
            .padding()
            .navigationTitle("我的")
        }
    }
}

