//
//  MenuView2.swift
//  huli-pizza
//
//  Created by Jonetta Pek on 27/11/23.
//

import SwiftUI

struct MenuView2: View {
    var menu: [MenuItem]
    @State private var selectedItem: MenuItem? = nil
    var body: some View {
        NavigationSplitView {
            List(menu, selection: $selectedItem) { item in
                NavigationLink(value: item) {
                    MenuRowView(item: item)
                }
            }
        } detail: {
            MenuDetailView(item: $selectedItem)
        }
    }
}

#Preview {
    MenuView2(menu: MenuModel().menu)
}
