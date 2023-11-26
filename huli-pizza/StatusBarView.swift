//
//  StatusBarView.swift
//  huli-pizza
//
//  Created by Jonetta Pek on 24/11/23.
//

import SwiftUI

struct StatusBarView: View {
    @Binding var showOrders: Bool
    @Binding var presentGrid: Bool
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
            if !showOrders {
                Button {
                    presentGrid.toggle()
                } label: {
                    Image(systemName: presentGrid ? "list.bullet" : "square.grid.3x2")
                }
            .padding(.leading, 10)
            }
            Spacer()
            Label {
                Text(orders.orderTotal, format: .currency(code: "USD"))
            } icon: {
                Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.fill")
            }
        }
        .foregroundStyle(.black)
        .font(.title2)
    }
}

#Preview {
    StatusBarView(showOrders: .constant(false), presentGrid: .constant(true))
        .environmentObject(OrderModel())
}
