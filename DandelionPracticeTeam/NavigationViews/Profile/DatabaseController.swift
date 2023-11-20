//
//  ImageAndDescriptionController.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/30.
//

import SwiftUI
class User:Decodable,Encodable {
    var isLogged: Bool
    var showAlert: Bool
    var username: String
    var password: String
    var description: String
    var avatar: String
    var favorites: [WeChatArt]
    var likedArticles: [String]
    init(isLogged: Bool = false, showAlert: Bool = true, username: String = "未登录", password: String = "", description: String = "这里是个人描述", avatar: String = "person.crop.circle",favorites: [WeChatArt] = [],likedArticles: [String] = []) {
        self.isLogged = isLogged
        self.showAlert = showAlert
        self.username = username
        self.password = password
        self.description = description
        self.avatar = avatar
        self.favorites = favorites
        self.likedArticles = likedArticles
    }
    // 增加自定义编码方法
       func encode(to encoder: Encoder) throws {
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(isLogged, forKey: .isLogged)
           try container.encode(showAlert, forKey: .showAlert)
           try container.encode(username, forKey: .username)
           try container.encode(password, forKey: .password)
           try container.encode(description, forKey: .description)
           try container.encode(avatar, forKey: .avatar)
           try container.encode(favorites, forKey: .favorites)
           try container.encode(likedArticles, forKey: .likedArticles)
       }

       // 增加 CodingKeys 枚举，用于指定属性的编码键
       enum CodingKeys: String, CodingKey {
           case isLogged
           case showAlert
           case username
           case password
           case description
           case avatar
           case favorites
           case likedArticles
       }
    
    static func loadUserData()->[User]{
        guard let url = Bundle.main.url(forResource: "Users.json", withExtension: nil),
              let data = try? Data(contentsOf: url) else {
            return []
        }

        do {
            let decoder = JSONDecoder()
            let users = try decoder.decode([User].self, from: data)
            return users
        } catch {
            print("Error decoding JSON: \(error)")
            return []
        }
    }
    
    static func saveUsers(users: [User]){
        let encoder=JSONEncoder()
        if let encoded = try? encoder.encode(users) {
            if let jsonString = String(data: encoded, encoding: .utf8) {
                let fileURL = URL(fileURLWithPath: "/Users/charles/Documents/coding_file/swift/DandelionPracticeTeam/DandelionPracticeTeam/NavigationViews/Profile/Users.json")
                do {
                    try jsonString.write(to: fileURL, atomically: true, encoding: .utf8)
                    print("Data saved to \(fileURL)")
                } catch {
                    print("Error saving data to file: \(error)")
                }
            }
        }
    }
}

struct Avatar: Identifiable {
    let id: Int
    let systemName: String
}

var DataTable: [String: User] = [:]



