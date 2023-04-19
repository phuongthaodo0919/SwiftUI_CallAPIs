//
//  Category.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/11/23.
//

import Foundation

struct Category: Identifiable {
    var id: Int
    var name: String
    var breedList: [Breed]
}
