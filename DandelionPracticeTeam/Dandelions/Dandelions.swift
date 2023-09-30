//
//  Dandelions.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/29.
//

import SwiftUI

struct Dandelions:View{
    var body:some View{
        VStack{
            Text("蒲公英们").font(.system(.largeTitle))
                .foregroundColor(.blue)
                .bold()
                .font(.system(.largeTitle))
                .fontWeight(.medium)
                .italic()
                .shadow(color: .black, radius: 1, x: 0, y: 2)
            MemberListView()
        }
    }
    
}

struct MemberListView: View {
    let members: [Member] = [
        .init(name: "高世骏", avatar: "GaoShiJun",introduction: "来自北京的高世骏，喜欢打游戏"),
        .init(name: "杜金阳", avatar: "DuJinYang",introduction: "热爱生活，元气满满的阳光小子"),
        .init(name: "黄钰", avatar: "HuangYu",introduction: "大家好，我是计算机学院2021级的黄钰，很高兴可以成为实践队的一员，和大家一起为乡村振兴做贡献。"),
        .init(name: "于洋", avatar: "YuYang",introduction: "hello 大家好我是蒲公英乡野航迹实践队的队员于洋。"),
        .init(name: "柯棋严", avatar: "KeQiYan",introduction: "个人简介待完善"),
        .init(name: "李南冰", avatar: "LiNanBing",introduction: "我是李南冰，来自天津，实践活动让我感受到了新时代中阳的发展与进步。"),
        .init(name: "李一豪", avatar: "LiYiHao",introduction: "冷酷的外表下隐藏着一颗火热的心。在熟悉的人面前，我就是一个天天傻笑的半吊子。没啥特别的爱好，但是啥也愿意尝试。"),
        .init(name: "崔怿恺", avatar: "CuiYiKai",introduction: "li v0 10; syscall;"),
        .init(name: "董佳荣", avatar: "DongJiaRong",introduction: "老二刺猿了"),
        .init(name: "何嘉怡", avatar: "HeJiaYi",introduction: "已毕业的社恐学姐， 很荣幸参加到本次实践中🌹"),
        .init(name: "尹馨平", avatar: "YinXingPing",introduction: "早安，我是一个平平无奇的乱入队友"),
    ]

    var body: some View {
        NavigationView {
            List {
                Section(header: AvatarView(imageName: "header_avatar", size: 200)
                            .padding(.top, -200)) { // 尝试调整此值以减少顶部的空白
                    ForEach(members, id: \.name) { member in
                        HStack {
                            AvatarView(imageName: member.avatar, size: 50)

                            VStack(alignment: .leading) {
                                Text(member.name)
                                    .font(.headline)
                                Text(member.introduction)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.leading)
                        }
                        .listRowInsets(EdgeInsets()) // 移除行的默认内边距
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
}
