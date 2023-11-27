//
//  OrderView.swift
//  huli-pizza
//
//  Created by Jonetta Pek on 20/11/23.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var orders: OrderModel
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    ForEach($orders.orderItems) { $order in
                        NavigationLink(value: order) {
                            OrderRowView(order: $order)
                                .padding(4)
                                .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 10)
                                .padding(.bottom, 5)
                                .padding([.leading, .trailing], 7)
                        }
                        .navigationDestination(for: OrderItem.self) { order in
                            OrderDetailView(orderItem: $order, presentSheet: .constant(false), newOrder: .constant(false))
                        }
                        .navigationTitle("Your Order")
                    }
                    .onDelete(perform: { indexSet in
                        orders.orderItems.remove(atOffsets: indexSet)
                    })
                    .onMove(perform: { source, destination in
                        orders.orderItems.move(fromOffsets: source, toOffset: destination)
                    })
                }
            }
            .padding(.top, 80)
        
            Button("Delete Order") {
                if !orders.orderItems.isEmpty {
                    orders.orderItems.removeLast()
                }
            }
            .padding(5)
            .background(.regularMaterial, in: Capsule())
            .padding(7)
        }
        .background(.regularMaterial)
    }
}

#Preview {
    OrderView(orders: OrderModel())
}
