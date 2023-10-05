//
//  TeamInfoView.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/30.
//

import SwiftUI

struct TeamInfoModalView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Spacer()
                    Text("扬帆起航")
                        .foregroundColor(.orange)
                        .bold()
                        .font(.system(.title))
                        .fontWeight(.medium)
                        .italic()
                        .shadow(color: .black, radius: 1, x: 0, y: 2)
                    Spacer()
                }
                Text("蒲公英乡野航迹实践队简介")
                    .foregroundColor(.orange)
                    .bold()
                    .font(.system(.title))
                    .fontWeight(.medium)
                    .italic()
                    .shadow(color: .black, radius: 1, x: 0, y: 2)
                
                ScrollView{
                    Text("      为深入学习贯彻习近平新时代中国特色社会主义思想，全面贯彻落实党的二十大精神，北航计算机学院蒲公英乡野航迹实践队将于暑假组织前往山西省吕梁市中阳县，主要针对文化、教育等方面展开实地调研，利用知识对当地产业赋能。")
                    Text("实践队队名队徽")
                        .foregroundColor(.black)
                        .font(.system(.title))
                        .bold()
                    Image("TeamLogo").resizable()
                        .frame(width: 200, height: 200,alignment: .center)
                    Text("      队名中的“蒲公英”寓意着希望实践队员像蒲公英一样，在风中扎根，生生不息，遍布全国各地（走遍天下300市）。“乡野”代表着广袤的农村大地和丰富多彩的乡村文化，也含有乡村振兴的意味。“航迹”则代表着队员们在行走的过程中所留下的足迹和记录，表示实践活动，也与北航本身相结合。")
                    NavigationLink(destination: PhotoWallView()){
                        Text("查看照片墙")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }.padding()
                    .background(
                        Image("Pic1").resizable()
                            .scaledToFill()
                    )
            }
        }
    }
}
