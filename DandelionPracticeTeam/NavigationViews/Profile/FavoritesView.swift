//
//  FavoriteView.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/30.
//

import SwiftUI

struct FavoritesView: View {
    // Assuming you have an array of strings as your favorites for simplicity.
    // This can be any custom data model.
    @EnvironmentObject var userData: UserData
    
    var favorites: [WeChatArt] {
         userData.favorites
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(favorites, id: \.self) { item in
                    Button(action: {
                        openURL(item.url)
                    }) {
                        Text(item.title)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("我的收藏")
            .toolbar {
                EditButton()
            }
        }
    }
    
    private func openURL(_ url: URL) {
        UIApplication.shared.open(url)
    }

    func removeItems(at offsets: IndexSet) {
        userData.favorites.remove(atOffsets: offsets)
    }
}

#if DEBUG
struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(UserData())
    }
}
#endif

