//
//  PageData.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/30.
//

import SwiftUI
struct PageData: Identifiable {
    var id: Int
    var imageName: String
    var description: String
    var sectionData: [SectionData]
}

struct PageViewContentView:View{
    var page:PageData
    
    var body:some View{
        ZStack {
            Image(page.imageName)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text(page.description)
                    .font(.largeTitle)
                    .foregroundColor(.orange)
                    .bold()
                    .padding()
                    .italic()
                    .shadow(color: .black, radius: 1, x: 0, y: 2)
                ForEach(page.sectionData) { section in
                    SectionDataView(section: section)
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
