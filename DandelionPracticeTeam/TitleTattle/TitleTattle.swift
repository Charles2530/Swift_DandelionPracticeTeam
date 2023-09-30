//
//  TitleTattle.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/29.
//

import SwiftUI
import SafariServices

struct TitleTattle:View{
    let articles: [WeChatArt] = [
            .init(title: "扬帆起航 | 蒲公英乡野航迹实践队简介", summary: "激昂青春！蒲公英乡野航迹实践队启航.", url: URL(string: "https://mp.weixin.qq.com/s/pOjhB6nxqayYnQAw3oGeQg")!),
            .init(title: "筑梦中阳 | Day.1 一键开启实践之旅", summary: "一键开启实践之旅.", url: URL(string: "https://mp.weixin.qq.com/s/F9zdgAxE3Hxj6EFCGpvkNA?poc_token=HJLsFmWjOAs1ywWv2PzJUz-TWh9A2J7lccWOZfIm")!),
            .init(title: "筑梦中阳 | Day.2 剪中阳之影，访阳坡之兴", summary: "剪中阳之影，访阳坡之兴.", url: URL(string: "https://mp.weixin.qq.com/s/Oh0-3yWtT8oabnmzYVfRiA")!),
            .init(title: "筑梦中阳 | Day.3 探中阳发展篇章 访民生实地调研", summary: "探中阳发展篇章 访民生实地调研.", url: URL(string: "https://mp.weixin.qq.com/s/R5znoLIcutuzwHEnlvwo7Q")!),
            .init(title: "筑梦中阳 | Day.4 寻觅自然风趣 品悟红色精神", summary: "寻觅自然风趣 品悟红色精神.", url: URL(string: "https://mp.weixin.qq.com/s/-fpSAKSE4y5W3nVpZE_L-g")!),
            .init(title: "实践总结", summary: "乡村振兴，任重而道远.", url: URL(string: "https://mp.weixin.qq.com/s/tWEW9_vceQZf4OUoVc85rQ")!)
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
                }
            }
        }.navigationTitle("蒲公英的杂谈")
    }

    // 打开URL的函数
    private func openURL(_ url: URL) {
        UIApplication.shared.open(url)
    }
    
}
