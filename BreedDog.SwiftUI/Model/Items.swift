//
//  Items.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/11/23.
//

import Foundation

struct MyItem: Identifiable{
    var id = UUID()
    var isFavourite: Bool
    
    var name: String {
        if isFavourite {
            return "Favorited item"
        }
        return "Not favorited"
    }

}
