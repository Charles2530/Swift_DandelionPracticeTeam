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
                        Text("用户名：\(userData.username)")
                        Text("个人描述：\(userData.description)")
                        NavigationLink(destination: ProfileEditView(userData: userData)) {
                            Text("编辑个人资料")
                        }
                        .padding()
                        NavigationLink(destination: FavoritesView()) {
                            Text("我的收藏")
                        }
                        Button("退出登录") {
                            logout()
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
    
    private func logout(){
        DataTable[userData.username] = User(
            username:userData.username,
            password: userData.password,
            description: userData.description,
            avatar: userData.avatar,
            favorites: userData.favorites,
            likedArticles: userData.likedArticles)
        User.saveUsers(users: DataTable.values.map{$0})
        userData.isLogged = false
        userData.username = "未登录"
        userData.password = ""
        userData.description = "这里是个人描述"
        userData.showAlert = true
        userData.avatar = "person.circle"
        userData.favorites = []
        userData.likedArticles = []
    }
}

#if DEBUG
struct ProfileModalView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileModalView()
            .environmentObject(UserData())
    }
}
#endif

