//
//  Article.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/29.
//

import SwiftUI
struct Article: Identifiable {
    var id: Int
    var title: String
    var content: String
}

struct ArticleDetailView: View {
    var article: Article
    
    var body: some View {
        ZStack{
            Image("Pic2")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                Text(article.title)
                    .font(.title)
                    .bold()
                    .padding()
                ScrollView {
                    Text(article.content)
                        .font(.body)
                        .padding()
                }
                    
            }
        }
    }
}
