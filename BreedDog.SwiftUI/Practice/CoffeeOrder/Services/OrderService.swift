//
//  OrderService.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/17/23.
//

import Foundation

class OrderService{
    
    func createOrder(body: OrderItem, completion: @escaping()->()){
        ProcessDataService.postData(body: body, dataType: OrderItem.self, apiName: OrderAPI.ordersAPI, completion: completion)
    }
    
    func fetchOrder(completion: @escaping([OrderItem]?) -> ()){
        let res = ProcessDataService.fetchData (dataType: OrderItem.self, apiName: OrderAPI.ordersAPI, completion: completion)
        
    }
    
}
