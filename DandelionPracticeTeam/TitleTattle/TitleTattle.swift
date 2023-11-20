//
//  TitleTattle.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/29.
//

import SwiftUI
import SafariServices

struct TitleTattle:View{
    @EnvironmentObject var userData: UserData
    
    @State private var articles: [WeChatArt] = WeChatArt.loadWeChatArts()

    var body: some View {
        NavigationView {
            List(articles, id: \.title) { article in
                VStack(alignment: .leading) {
                    Text(article.title)
                        .font(.headline)
                    Text(article.summary)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Button("Read") {
                        openURL(article.url)
                    }
                    .padding(.top, 8)
                    if userData.isLogged {
                        HStack {
                            Image(systemName: userData.favorites.contains(article) ? "heart.fill" : "heart")
                                .foregroundColor(userData.favorites.contains(article) ? .red : .gray)
                                .onTapGesture {
                                    article.isFavorite.toggle()
                                    favoriteChanged(article)
                                }
                            Image(systemName: userData.likedArticles.contains(article.title) ? "hand.thumbsup.fill" : "hand.thumbsup")
                                .foregroundColor(userData.likedArticles.contains(article.title) ? .green : .gray)
                                .onTapGesture {
                                    likeArticle(article)
                                }
                            Text("\(article.likes) likes")
                        }
                        .padding(.top, 4)
                    } else {
                        Text("登陆后可以点赞及收藏")
                            .foregroundColor(.gray)
                            .padding(.top, 4)
                    }
                }
            }
        }.navigationTitle("蒲公英的杂谈")
    }

    // 打开URL的函数
    private func openURL(_ url: URL) {
        UIApplication.shared.open(url)
    }
    
    private func favoriteChanged(_ article: WeChatArt) {
        if let index = userData.favorites.firstIndex(of: article) {
            userData.favorites.remove(at: index)
        } else {
            userData.favorites.append(article)
        }
        DataTable[userData.username] = User(isLogged: true, showAlert: false, username: userData.username, password: userData.password, description: userData.description, favorites: userData.favorites, likedArticles: userData.likedArticles)
        User.saveUsers(users: DataTable.values.map{$0})
    }
    
    private func likeArticle(_ article: WeChatArt) {
        if !userData.likedArticles.contains(article.title) {
            article.likes += 1
            userData.likedArticles.append(article.title)
        } else {
            article.likes -= 1
            if let index = userData.likedArticles.firstIndex(of: article.title) {
                userData.likedArticles.remove(at: index)
            }
        }
        DataTable[userData.username] = User(isLogged: true, showAlert: false, username: userData.username, password: userData.password, description: userData.description, favorites: userData.favorites, likedArticles: userData.likedArticles)
        User.saveUsers(users: DataTable.values.map{$0})
    }
}

#if DEBUG
struct TitleTattle_Previews: PreviewProvider {
    static var previews: some View {
        TitleTattle()
            .environmentObject(UserData())
    }
}
#endif

