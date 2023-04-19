//
//  BreedDetails.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/11/23.
//

import SwiftUI

struct BreedDetails: View {
    var breed: Breed
    
    var body: some View {
        VStack {
            Image(breed.images[0])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 350)
//            Text(breed.name)
//                .font(.title)
            Text(breed.description)
                .font(.body)
            Spacer()
            Button("Add photo") {
                Text("Add")
            }
        }.navigationBarTitle(breed.name, displayMode: .inline)
        .padding()
    }
}

struct BreedDetails_Previews: PreviewProvider {
    static var previews: some View {
        BreedDetails(breed: Breed())
    }
}
