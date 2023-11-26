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
            ZStack(alignment: .top) {
                ScrollView {
                    ForEach($orders.orderItems) { order in
                        OrderRowView(order: order)
                            .padding(4)
                            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                            .padding(.bottom, 5)
                            .padding([.leading, .trailing], 7)
                    }
                }
                .padding(.top, 80)
                
                HStack {
                    Text("Order Pizza").font(.title)
                    Spacer()
                }
                .padding()
                .background(.ultraThinMaterial)
            }
                .padding()
            Button("Delete Order") {
                if !orders.orderItems.isEmpty {
                    orders.orderItems.removeLast()
                }
            }
            .padding(5)
            .background(.regularMaterial, in: Capsule())
            .padding(7)
        }
        .background(Color("Surf"))
    }
}

#Preview {
    OrderView(orders: OrderModel())
}
