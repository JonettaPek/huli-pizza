//
//  ContentView.swift
//  huli-pizza
//
//  Created by Jonetta Pek on 20/11/23.
//

import SwiftUI

struct ContentView: View {
    var menu: [MenuItem]
    @StateObject var orders: OrderModel = OrderModel()
    @State private var selectedItem: MenuItem = testMenuItem
    @State private var showOrders: Bool = false
    @State private var presentGrid: Bool = false
    var body: some View {
        TabView {
            VStack {
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light)
                StatusBarView(showOrders: $showOrders, presentGrid: $presentGrid)
//                MenuItemView(item: $selectedItem, orders: orders)
//                    .padding(5)
//                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
//                if presentGrid {
//                    MenuGridView(menu: menu, selectedItem: $selectedItem)
//                } else {
//                    MenuView(menu: menu, selectedItem: $selectedItem)
//                }
                MenuView2(menu: menu)
                Spacer()
            }
            .tabItem {
                Label("Menu", systemImage: "list.bullet")
            }
            VStack {
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light)
                StatusBarView(showOrders: $showOrders, presentGrid: $presentGrid)
                OrderView(orders: orders)
                    .cornerRadius(10)
                Spacer()
            }
            .tabItem {
                Label("Order", systemImage: "cart")
            }
        }
        .padding()
        .background(.linearGradient(colors: [Color.cyan, Color("Surf"), Color("Sky"), .white], startPoint: .topLeading, endPoint: .bottomTrailing))
        .environmentObject(orders)
    }
}

#Preview {
    ContentView(menu: MenuModel().menu)
}


