//
//  DandelionPracticeTeamApp.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/29.
//

import SwiftUI

@main
struct DandelionPracticeTeamApp: App {
    init() {
        // Predefined user
        let Users:[User] = User.loadUserData()
        for user in Users {
            DataTable[user.username] = user
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(UserData())
        }
    }
}
