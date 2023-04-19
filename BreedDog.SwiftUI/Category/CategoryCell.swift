//
//  CategoryCell.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/11/23.
//

import SwiftUI

struct CategoryCell: View {
    var category: Category
    
    var body: some View {
        List {
            Text(category.name)
                .font(.title)
                .bold()
            
            ForEach(category.breedList) {breed in
                NavigationLink{
                    BreedDetails(breed: breed)
                } label: {
                    Text(breed.name)
                }
            }
            
        }
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(category: Category(id: 1, name:"A", breedList: [Breed(), Breed()]))
    }
}
