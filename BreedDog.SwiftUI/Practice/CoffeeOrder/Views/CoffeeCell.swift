//
//  CoffeeCell.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/18/23.
//

import SwiftUI

struct CoffeeCell: View {
    var coffeeVM: CoffeeViewModel
    @Binding var selectedCoffee: String
    
    var body: some View {
        HStack {
            Image(coffeeVM.imageUrl)
                .resizable()
                .frame(width: 80, height: 80)
            
            VStack (alignment: .leading) {
                Text(coffeeVM.name).font(.title2)
                Text(coffeeVM.priceStr).font(.body)
            }.padding(.leading, 10)
            
            Spacer()
            Image(systemName: coffeeVM.name == selectedCoffee ? "checkmark" : "")
            
        }.padding()
            .onTapGesture {
                selectedCoffee = coffeeVM.name
            }
    }
}

struct CoffeeCell_Previews: PreviewProvider {

    
    static var previews: some View {
        @State var name = "String"
        
        return CoffeeCell(coffeeVM: CoffeeViewModel(coffee: Coffee(name: "Frapachino", imageUrl: "Frapachino", price: 12)), selectedCoffee: $name)
    }
}
