//
//  WeChatArt.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/29.
//
import SwiftUI

class WeChatArt: ObservableObject, Identifiable, Equatable, Hashable, Decodable {
    let id = UUID()
    let title: String
    let summary: String
    let url: URL
    @Published var likes: Int
    @Published var isFavorite: Bool

    enum CodingKeys: CodingKey {
        case title, summary, url, likes, isFavorite
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        summary = try container.decode(String.self, forKey: .summary)
        url = try container.decode(URL.self, forKey: .url)
        likes = try container.decode(Int.self, forKey: .likes)
        isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
    }

    init(title: String, summary: String, url: URL, likes: Int, isFavorite: Bool) {
        self.title = title
        self.summary = summary
        self.url = url
        self.likes = likes
        self.isFavorite = isFavorite
    }
    
    static func == (lhs: WeChatArt, rhs: WeChatArt) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    // Static method for loading data from JSON
    static func loadWeChatArts() -> [WeChatArt] {
        guard let url = Bundle.main.url(forResource: "WechatArts.json", withExtension: nil),
              let data = try? Data(contentsOf: url) else {
            return []
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .iso8601

            let articles = try decoder.decode([WeChatArt].self, from: data)
            return articles
        } catch {
            print("Error decoding JSON: \(error)")
            return []
        }
    }
}
