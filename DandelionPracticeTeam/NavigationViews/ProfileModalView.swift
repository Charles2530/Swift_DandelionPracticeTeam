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
                        userData.avatar
                            .resizable()
                            .frame(width: 100, height: 100)
                        
                        Text(userData.username)
                        Button("退出登录") {
                            userData.isLogged = false
                            userData.username = "未登录"
                            userData.password = ""
                            userData.description = "这里是个人描述"
                        }
                        .padding()
                    }
                } else {
                    NavigationLink(destination: LoginView()) {
                        Text("登录/注册")
                    }
                }
            }
            .padding()
            .navigationTitle("我的")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileModalView()
            .environmentObject(UserData())
    }
}
