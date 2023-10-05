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
    
    @State private var articles: [WeChatArt] = [
            .init(title: "扬帆起航 | 蒲公英乡野航迹实践队简介", summary:
                    "激昂青春！蒲公英乡野航迹实践队启航.", url: URL(string: "https://mp.weixin.qq.com/s/pOjhB6nxqayYnQAw3oGeQg")!
                , likes: 0, isFavorite: false),
            .init(title: "筑梦中阳 | Day.1 一键开启实践之旅", summary: "一键开启实践之旅.", url: URL(string: "https://mp.weixin.qq.com/s/F9zdgAxE3Hxj6EFCGpvkNA?poc_token=HJLsFmWjOAs1ywWv2PzJUz-TWh9A2J7lccWOZfIm")!
                , likes: 0, isFavorite: false),
            .init(title: "筑梦中阳 | Day.2 剪中阳之影，访阳坡之兴", summary: "剪中阳之影，访阳坡之兴.", url: URL(string: "https://mp.weixin.qq.com/s/Oh0-3yWtT8oabnmzYVfRiA")!
                , likes: 0, isFavorite: false),
            .init(title: "筑梦中阳 | Day.3 探中阳发展篇章 访民生实地调研", summary: "探中阳发展篇章 访民生实地调研.", url: URL(string: "https://mp.weixin.qq.com/s/R5znoLIcutuzwHEnlvwo7Q")!
                , likes: 0, isFavorite: false),
            .init(title: "筑梦中阳 | Day.4 寻觅自然风趣 品悟红色精神", summary: "寻觅自然风趣 品悟红色精神.", url: URL(string: "https://mp.weixin.qq.com/s/-fpSAKSE4y5W3nVpZE_L-g")!
                , likes: 0, isFavorite: false),
            .init(title: "实践总结", summary: "乡村振兴，任重而道远.", url: URL(string: "https://mp.weixin.qq.com/s/tWEW9_vceQZf4OUoVc85rQ")!
                , likes: 0, isFavorite: false)
        ]
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
        //print("\(article.title) is now \(article.isFavorite ? "favorite" : "not favorite")")
        if let index = userData.favorites.firstIndex(of: article) {
            userData.favorites.remove(at: index)
        } else {
            userData.favorites.append(article)
        }
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
    }
}
