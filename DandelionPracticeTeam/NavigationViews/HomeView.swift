//
//  HomeView.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/30.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("ZhongYangFromSky").padding()
                VStack{
                    VStack {
                        Image("TeamLogo").resizable()
                            .frame(width: 200, height: 200,alignment: .center)
                        Text("蒲公英")
                            .foregroundColor(.orange)
                            .bold()
                            .font(.system(.largeTitle))
                            .fontWeight(.medium)
                            .italic()
                            .shadow(color: .black, radius: 1, x: 0, y: 2)
                        Text("\"乡野航际\"实践队")
                            .foregroundColor(.green)
                            .bold()
                            .font(.system(.largeTitle))
                            .fontWeight(.medium)
                            .italic()
                            .shadow(color: .black, radius: 1, x: 0, y: 2)
                        NavigationLink(destination: CountyFeaturesView()) {
                            Text("县城特色")
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(.title))
                                .fontWeight(.medium)
                                .italic()
                                .shadow(color: .black, radius: 1, x: 0, y: 2)
                        }.padding()
                        NavigationLink(destination: PublicInterviews()) {
                            Text("百姓访谈")
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(.title))
                                .fontWeight(.medium)
                                .italic()
                                .shadow(color: .black, radius: 1, x: 0, y: 2)
                        }.padding()
                        NavigationLink(destination: Dandelions()) {
                            Text("蒲公英们")
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(.title))
                                .fontWeight(.medium)
                                .italic()
                                .shadow(color: .black, radius: 1, x: 0, y: 2)
                        }.padding()
                        NavigationLink(destination: TitleTattle()) {
                            Text("杂谈")
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(.title))
                                .fontWeight(.medium)
                                .italic()
                                .shadow(color: .black, radius: 1, x: 0, y: 2)
                        }.padding()
                    }.padding()
                        .background(
                            Color.gray.opacity(0.7).blur(radius: 5)
                        )
                }
            }
        }
    }
}
