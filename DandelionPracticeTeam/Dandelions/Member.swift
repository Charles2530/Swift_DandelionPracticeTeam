//
//  Member.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/29.
//

import SwiftUI

class Member: Decodable,Encodable {
    var name: String
    var avatar: String
    var introduction: String

    // 初始化方法
    init(name: String, avatar: String, introduction: String) {
        self.name = name
        self.avatar = avatar
        self.introduction = introduction
    }

    static func loadMembers() -> [Member] {
        guard let url = Bundle.main.url(forResource: "Members.json", withExtension: nil) , let data = try? Data(contentsOf: url) else {
            return []
        }
        
        do {
            let decoder = JSONDecoder()
            // Custom decoder for URL since your JSON contains URL as String
            let members = try decoder.decode([Member].self, from: data)
            return members
        } catch {
            print("Error decoding JSON: \(error)")
            return []
        }
    }
    
    static func saveMembers(members:[Member]){
        let encoder=JSONEncoder()
        if let encoded = try? encoder.encode(members) {
            if let jsonString = String(data: encoded, encoding: .utf8) {
                if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                    let fileURL = documentsDirectory.appendingPathComponent("Members.json")
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
}

struct AvatarView: View {
    let imageName: String
    var size: CGFloat = 100
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: size, height: size)
            .clipShape(Circle())
    }
}
