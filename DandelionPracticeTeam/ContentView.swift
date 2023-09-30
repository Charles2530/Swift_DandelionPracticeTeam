//
//  ContentView.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/29.
//

import SwiftUI
struct ContentView: View {
    @EnvironmentObject var userData: UserData
    
    @State private var showImageModal = false
    
    var body: some View {
        TabView {
            HomeView().tabItem {
                Label("主页", systemImage: "house").background(Color.black.opacity(0.8)).cornerRadius(8)
            }.background(Color.black.opacity(0.8)).cornerRadius(8)
            
            TeamInfoModalView().tabItem {
                Label("实践队简介", systemImage: "info.circle").background(Color.black.opacity(0.8)).cornerRadius(8)
            }

            Button(action: {
                showImageModal.toggle()
            }) {
                VStack{
                    Image("LvLiangTeam").padding()
                    Label("点击这里，关注我们", systemImage: "star")
                        .foregroundColor(.orange)
                        .bold()
                        .font(.system(.largeTitle))
                        .fontWeight(.medium)
                        .italic()
                        .shadow(color: .black, radius: 1, x: 0, y: 2)
                }
            }
            .sheet(isPresented: $showImageModal) {
                ImageViewer()
            }
            .tabItem {
                Label("关注我们", systemImage: "star")
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(8)
            }.background(Image("Pic2").resizable().scaledToFill()).cornerRadius(8)

            ProfileModalView().tabItem {
                Label("我的", systemImage: "person.circle").background(Color.black.opacity(0.8)).cornerRadius(8)
            }
        }.background(Color.black)
//        .alert(isPresented: $userData.showAlert) {
//            Alert(title: Text("未登录"),
//                  message: Text("登陆后可以点赞，评论和收藏哦！！！快去登陆吧"),
//                  dismissButton: .default(Text("确定")) {
//                        
//                  })
//        }
    }
}

#Preview {
    ContentView().environmentObject(UserData())
}
