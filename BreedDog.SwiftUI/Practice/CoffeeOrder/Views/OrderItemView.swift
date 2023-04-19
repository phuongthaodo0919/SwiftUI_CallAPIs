//
//  OrderItem.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/17/23.
//

import SwiftUI

struct OrderItemView: View {
    var orderItem: OrderItemViewModel
    
    var body: some View {
        HStack {
            Image(orderItem.coffeeName)
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.trailing, 10)
            VStack(alignment: .leading) {
                Text(orderItem.name).font(.title)
                Text(orderItem.coffeeName).font(.body)
                Text("Total: \(orderItem.totalString)").font(.body)
                Text("Size: \(orderItem.size.rawValue)").font(.body)
            }
            Spacer()
        }.padding()
    }
}

struct OrderItem_Previews: PreviewProvider {
    static var previews: some View {
        OrderItemView(orderItem: OrderItemViewModel(orderItem: OrderItem(name: "Hello", coffeeName: "Cappuccino", total: 1.5, size: "Small")))
    }
}
