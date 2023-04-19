//
//  OrderModelView.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/17/23.
//

import Foundation
import SwiftUI

struct OrderItemViewModel: Identifiable {
    
    var id = UUID()
    var name: String
    var coffeeName: String
    var total:  Double
    var size: OrderSize
    
    var totalString: String {
        String(format: "%.0f", total)
    }
    
    init(orderItem: OrderItem) {
        self.name = orderItem.name
        self.coffeeName = orderItem.coffeeName
        self.total = orderItem.total
        self.size = OrderSize(rawValue: orderItem.size)!
    }
}

enum OrderSize: String, CaseIterable{
    case Small = "Small"
    case Medium = "Medium"
    case Large = "Large"

}

class OrderViewModel: ObservableObject {
    
    private var orderService: OrderService
    @Published var orderList: [OrderItemViewModel]
    
    init() {
        orderService = OrderService()
        orderList = []
        fetchOrder()
        
    }
    
    func fetchOrder(){
        orderService.fetchOrder { orderRes in
            if let orderRes {
                self.orderList = orderRes.map(OrderItemViewModel.init)
                print("Inside :\(self.orderList)")
            }
        }
        
        print("Outside: \(self.orderList)")
    }
}
