//
//  OrderRowView.swift
//  huli-pizza
//
//  Created by Jonetta Pek on 20/11/23.
//

import SwiftUI

struct OrderRowView: View {
    @Binding var order: OrderItem
    var body: some View {
        VStack {
            HStack(alignment: .firstTextBaseline) {
                Text(order.item.name)
                Spacer()
            }
            HStack {
                Text(order.quantity, format: .number)
                Text(order.item.price, format: .currency(code: "USD"))
                Spacer()
                Text(order.extPrice, format: .currency(code: "USD"))
            }
        }
    }
}

#Preview {
    OrderRowView(order: .constant(testOrderItem))
}
