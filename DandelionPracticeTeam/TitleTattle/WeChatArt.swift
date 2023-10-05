//
//  WeChatArt.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/29.
//
import SwiftUI

class WeChatArt: ObservableObject,Equatable,Hashable {
    let title: String
    let summary: String
    let url: URL
    @Published var likes: Int
    @Published var isFavorite: Bool

    init(title: String, summary: String, url: URL, likes: Int, isFavorite: Bool) {
        self.title = title
        self.summary = summary
        self.url = url
        self.likes = likes
        self.isFavorite = isFavorite
    }
    
    static func == (lhs: WeChatArt, rhs: WeChatArt) -> Bool {
        return lhs.title == rhs.title && lhs.summary == rhs.summary && lhs.url == rhs.url && lhs.likes == rhs.likes && lhs.isFavorite == rhs.isFavorite
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(summary)
        hasher.combine(url)
    }
}

