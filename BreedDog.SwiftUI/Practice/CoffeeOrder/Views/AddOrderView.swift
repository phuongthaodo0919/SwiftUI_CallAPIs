//
//  AddOrderView.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/18/23.
//

import SwiftUI

struct AddOrderView: View {
    @Binding var isPresented: Bool
    @ObservedObject var addOrderVM: AddOrderViewModel

    
    init(showModal: Binding<Bool>){
        addOrderVM = AddOrderViewModel()
        self._isPresented = showModal
    }
    
    var body: some View {
        VStack {
            Form{
                Section(
                    header: Text("Information")) {
                        TextField("Enter name", text: $addOrderVM.name)
                    }
                
                Section (
                    header: Text("Select coffee")) {
                        
                        ForEach(addOrderVM.coffeeList, id: \.name) { coffee in
                            CoffeeCell(coffeeVM: coffee, selectedCoffee: $addOrderVM.coffeeName)
                        }
                    }
                Section (
                    header: Text("Choose coffee size"), footer: OrderTotalView(total: addOrderVM.totalPrice)) {
                        Picker("", selection: $addOrderVM.size) {
                            ForEach(OrderSize.allCases, id:\.rawValue) { orderSize in
                                Text(orderSize.rawValue).tag(orderSize)
                            }
                        }.pickerStyle(.segmented)
                    }
                
            }
            
            
            HStack {
                Button("Place Order") {
                    addOrderVM.createOrder()
                    isPresented = false
                }
                }.padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                .foregroundColor(.white)
                .background {
                    Color(UIColor(red: 0.53, green: 0.80, blue: 0.73, alpha: 1.00))
            }
        }
        
        
    }
}

struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView(showModal: .constant(false))
    }
}
