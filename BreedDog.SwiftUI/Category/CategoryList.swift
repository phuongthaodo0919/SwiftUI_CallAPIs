//
//  CategoryList.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/11/23.
//

import SwiftUI

struct CategoryList: View {
    var categories: [Category]
    
    var body: some View {
        NavigationView{
            ForEach(categories) { category in
                CategoryCell(category: category)
                
            }.navigationTitle("Breed list")
        }
    }
    
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList(categories: [Category(id: 1, name:"A", breedList: [Breed(), Breed()])])
    }
}
