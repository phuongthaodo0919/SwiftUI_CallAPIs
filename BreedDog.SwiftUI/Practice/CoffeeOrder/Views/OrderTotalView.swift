//
//  OrderTotalView.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/19/23.
//

import SwiftUI

struct OrderTotalView: View {
    let total: Double
    
    var body: some View {
        HStack {
            Text(String(format: "$%.2f", total)).font(.title2)
        }.padding(10)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 40.5)
    }
}
