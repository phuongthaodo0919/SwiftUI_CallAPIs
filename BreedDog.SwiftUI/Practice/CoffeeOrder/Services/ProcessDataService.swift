//
//  FetchDataService.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/17/23.
//

import Foundation

struct OrderAPI {
    static var orderDomain = "https://island-bramble.glitch.me"
    static var ordersAPI = "/orders"
}

struct ProcessDataService {
    private init(){}
    
    
    static func postData<T: Encodable>(body: T,dataType: T.Type, apiName: String, completion: @escaping()-> ()) {
        guard let url = URL(string: "\(OrderAPI.orderDomain)\(apiName)") else {
            fatalError("URL is incorrect")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            urlRequest.httpBody = try JSONEncoder().encode(body)
        } catch {
            fatalError("Couldn't encode data")
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, err in
            guard let data else {
                fatalError("Data is underfined")
            }
            do {
                let result = try JSONDecoder().decode(CreateOrderResponse.self, from: data)
                DispatchQueue.main.async {
                    print(result)
                }

            } catch {
                fatalError("Decode data is failed")
            }
        }.resume()
        
    }
    
    static func fetchData<T: Decodable>(dataType: T.Type, apiName: String, completion: @escaping([T]?) -> ()){
        let url = URL(string: "\(OrderAPI.orderDomain)\(apiName)")
        
        guard let url else {
            fatalError("URL is incorrect")
        }
       
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                completion(nil)
                fatalError("Data is underfined")
            }
            do {
                let decoderResponse = try JSONDecoder().decode([T].self, from: data)
                DispatchQueue.main.async {
                    completion(decoderResponse)
                }
            } catch {
                fatalError("Decode data is failed")
            }
        }.resume()
        
    }
    
}
