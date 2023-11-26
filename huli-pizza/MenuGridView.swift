//
//  MenuGridView.swift
//  huli-pizza
//
//  Created by Jonetta Pek on 26/11/23.
//

import SwiftUI

struct MenuGridView: View {
    var menu: [MenuItem]
    @Binding var selectedItem: MenuItem
    @State private var favorites: [Int] = []
    func menu(id: Int) -> MenuItem {
        menu.first(where: {$0.id == id}) ?? noMenuItem
    }
    let columnLayout: Array = Array(repeating: GridItem(), count: 3)
    let favoriteColumnLayout: Array = Array(repeating: GridItem(), count: 5)
    @Namespace private var namespace
    var body: some View {
        VStack {
            LazyVGrid(columns: favoriteColumnLayout) {
                ForEach(favorites.sorted(), id: \.self) { index in
                    FavoriteTileView(menuItem: menu(id: index))
                        .matchedGeometryEffect(id: index, in: namespace)
                        .onTapGesture {
                            selectedItem = menu(id: index)
                        }
                        .onLongPressGesture {
                            if let index = favorites.first(where: {$0 == index}) {
                                favorites.remove(at: index)
                            }
                        }
                }
            }
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(menu) { item in
                        if !favorites.contains(item.id) {
                            MenuItemTileView(menuItem: item)
//                                .animation(.easeOut, value: favorites)
                                .matchedGeometryEffect(id: item.id, in: namespace)
                                .onTapGesture(count: 2) {
                                    if !favorites.contains(item.id) {
                                        withAnimation(.easeInOut) {
                                            favorites.append(item.id)
                                        }
                                    }
                                }
                                .onTapGesture {
                                    selectedItem = item
                                }
                                .onLongPressGesture {
                                    selectedItem = noMenuItem
                                } // 2 taps > 1 tap > short > long
                        }
                    }
                }
            }
        }
        .animation(.easeOut(duration: 1.5), value: favorites)
    }
}

#Preview {
    MenuGridView(menu: MenuModel().menu, selectedItem: .constant(testMenuItem))
}
