//
//  StatusBarView.swift
//  huli-pizza
//
//  Created by Jonetta Pek on 24/11/23.
//

import SwiftUI

struct StatusBarView: View {
    @Binding var showOrders: Bool
    @EnvironmentObject var orders: OrderModel
    var body: some View {
        HStack {
            Text("\(orders.orderItems.count) orders")
            Spacer()
            Button {
                showOrders.toggle()
            } label: {
                Image(systemName: showOrders ? "menucard" : "cart")
            }
            Spacer()
            Label {
                Text(orders.orderTotal, format: .currency(code: "USD"))
            } icon: {
                Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.fill")
            }
        }
        .foregroundStyle(.white)
        .font(.title2)
    }
}

#Preview {
    StatusBarView(showOrders: .constant(false)).environmentObject(OrderModel())
}
