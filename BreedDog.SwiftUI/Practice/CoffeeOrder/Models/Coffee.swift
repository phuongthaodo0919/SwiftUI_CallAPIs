//
//  Coffee.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/18/23.
//

import Foundation


struct Coffee{
    let name: String
    let imageUrl: String
    let price: Double
}
extension Coffee {
    static func all() -> [Coffee] {
        return [
            Coffee(name: "Cappuccino", imageUrl: "Cappuccino", price: 2.5),
            Coffee(name: "Expresso", imageUrl: "Expresso", price: 2.7),
            Coffee(name: "Regular", imageUrl: "Regular", price: 1.5),
        ]
    }
}
