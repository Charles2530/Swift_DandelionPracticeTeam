//
//  PublicInterviews.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/29.
//

import SwiftUI

struct PublicInterviews:View{
    @State private var articles: [Article] = Article.loadArticles()

    var body:some View{
        NavigationView{
            ZStack{
                Image("Pic1")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20){
                    Text("      在中阳县城内以及阳坡村，实践队成员广泛开展了走访调查，深入走访对象的生活，坐到百姓的家中，力求收集最真实，最可信的第一手资料。\n 实践队员针对当地百姓生活状况、乡村振兴成果与乡村振兴困境进行多角度访谈。").padding()
                    Spacer()
                    List(articles) { article in NavigationLink(destination: ArticleDetailView(article: article)) {
                            Text(article.title)
                        }.listRowBackground(Color.clear)
                    }
                    .navigationTitle("百姓访谈")
                    .background(Color.clear)
                }.padding()
            }
        }
    }
    
}

#if DEBUG
struct PublicInterviews_Previews: PreviewProvider {
    static var previews: some View {
        PublicInterviews()
    }
}
#endif

