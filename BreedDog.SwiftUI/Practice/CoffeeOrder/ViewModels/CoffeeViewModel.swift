//
//  CoffeeViewModel.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/18/23.
//

import Foundation


struct CoffeeViewModel {
    private var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var name: String {
        coffee.name
    }
    
    var imageUrl: String {
        coffee.imageUrl
    }
    
    var price: Double{
        coffee.price
    }
    
    var priceStr: String {
        String(format: "%.0f", coffee.price)
    }
    
    
}
