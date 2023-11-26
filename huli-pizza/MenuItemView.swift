//
//  MenuRowItemView.swift
//  huli-pizza
//
//  Created by Jonetta Pek on 20/11/23.
//

import SwiftUI

struct MenuItemView: View {
    @State var addedItem: Bool = false
    @State var presentAlert: Bool = false
    @State private var newOrder: Bool = true
    @State private var order: OrderItem = noOrderItem
    @Binding var item: MenuItem
    @ObservedObject var orders: OrderModel
    var body: some View {
        VStack {
            HStack {
                Text(item.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.ultraThickMaterial)
                //.foregroundColor(Color(red: 0.38, green: 0.522, blue: 0.749))
                    .padding(5)
                if let image = UIImage(named: "\(item.id)_lg") {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .padding([.top, .bottom], 5)
                        .cornerRadius(10)
                    //.clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    Image("surfboard_lg")
                        .resizable()
                        .scaledToFit()
                        .rotationEffect(.degrees(180))
                }
            }
            .background(.linearGradient(colors: [Color("Surf"), Color("Sky").opacity(0.1)], startPoint: .leading, endPoint: .trailing), in: Capsule())
            .shadow(color:.teal, radius: 5, x: 8, y: 8)
            
            VStack(alignment: .leading) {
                ScrollView {
                    Text(item.description)
                        .font(.custom("Georgia", size: 18, relativeTo: .body))
                }
            }
            
            Button {
                order = OrderItem(id: -999, item: item)
                presentAlert = true
            } label: {
                Spacer()
                Text(item.price, format: .currency(code: "USD"))
                Image(systemName: addedItem ? "cart.fill.badge.plus" : "cart.badge.plus")
                Spacer()
            }
            .disabled(item.id < 0)
            .padding()
            .background(.red, in: Capsule())
            .foregroundStyle(.white)
            .padding(5)
//            .alert("Add \(item.name) to cart, confirm?", isPresented: $presentAlert) {
//                Button("Yes") {
//                    addedItem = true
//                    orders.addOrder(item, quantity: 1)
//                }
//                Button("No", role: .cancel) {}
//                Button("Make it a double!") {
//                    addedItem = true
//                    orders.addOrder(item, quantity: 2)
//                }
//            }
            .sheet(isPresented: $presentAlert) {
                addedItem = true
            } content: {
                OrderDetailView(orderItem: $order, presentSheet: $presentAlert, newOrder: $newOrder)
            }
            
        }
    }
}

#Preview {
    MenuItemView(item: .constant(testMenuItem), orders: OrderModel())
}
