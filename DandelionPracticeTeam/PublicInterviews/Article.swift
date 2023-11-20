//
//  Article.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/29.
//

import SwiftUI
class Article: Identifiable,Decodable {
    var id: Int
    var title: String
    var content: String
    
    init(id: Int, title: String, content: String) {
        self.id = id
        self.title = title
        self.content = content
    }
    
    static func loadArticles() -> [Article] {
        guard let url = Bundle.main.url(forResource: "Articles.json", withExtension: nil) , let data = try? Data(contentsOf: url) else {
            return []
        }
        
        do {
            let decoder = JSONDecoder()
            // Custom decoder for URL since your JSON contains URL as String
            
            
            let articles = try decoder.decode([Article].self, from: data)
            return articles
        } catch {
            print("Error decoding JSON: \(error)")
            return []
        }
    }
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
