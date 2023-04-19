//
//  AddOrderViewModel.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/17/23.
//

import Foundation

class AddOrderViewModel: ObservableObject {
    var name: String = ""
    @Published var size: OrderSize = OrderSize.Small
    @Published var coffeeName: String = ""
    
    private var orderService: OrderService
    init(){
        orderService = OrderService()
    }
    
    var coffeeList: [CoffeeViewModel] {
        Coffee.all().map(CoffeeViewModel.init)
    }
    
    private func priceForSale() -> Double {
        let price = [OrderSize.Small: 2.0, OrderSize.Medium: 5.0, OrderSize.Large: 10.0]
        return price[self.size]!
    }
    
    var totalPrice: Double {
        if let coffeePrice = coffeeList.first{ $0.name == coffeeName} {
            return coffeePrice.price + priceForSale()
        }
      return 0
        
    }
    
    func createOrder() {
        let orderItem = OrderItem(name: name, coffeeName: coffeeName, total: totalPrice, size: size.rawValue)
        orderService.createOrder(body: orderItem) {
            print("Create successfully!")
        }
    }
}
