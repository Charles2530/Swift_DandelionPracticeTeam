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
    @State private var favorites = ["Item 1", "Item 2", "Item 3", "Item 4"]

    var body: some View {
        NavigationView {
            List {
                ForEach(favorites, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("我的收藏")
            .toolbar {
                EditButton()
            }
        }
    }

    func removeItems(at offsets: IndexSet) {
        favorites.remove(atOffsets: offsets)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
