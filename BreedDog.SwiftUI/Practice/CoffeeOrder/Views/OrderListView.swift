//
//  OrderList.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/17/23.
//

import SwiftUI

struct OrderListView: View {
    
    @ObservedObject var orderVM: OrderViewModel
    @State private var showModal: Bool = false
    
    init(){
        orderVM = OrderViewModel()
    }
    
    var body: some View {
        NavigationView {
            List (orderVM.orderList, id:\.id ){ item in
                OrderItemView(orderItem: item)
            }
            .navigationTitle("Order list")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: reloadOrders, label: {
                        Image(systemName: "arrow.clockwise")
                    })

                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: showAddOrderView) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showModal) {
                AddOrderView(showModal: $showModal)
            }
        }
    }
    
    private func reloadOrders(){
        orderVM.fetchOrder()
    }
    private func showAddOrderView(){
        showModal = true
    }
}

struct OrderList_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
        
    }
}
