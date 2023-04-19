//
//  DogMainView.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/16/23.
//

import SwiftUI

struct DogMainView: View {
    var categories: [Category]
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Dog Breed")
                    .font(.title)
                    .bold()
                Image("dog")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                NavigationLink{
                    CategoryList(categories: categories)
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("Lets go")
                }
            }
            .padding()
        }
    }
}

struct DogMainView_Previews: PreviewProvider {
    static var previews: some View {
        DogMainView(categories: [Category(id: 1, name:"A", breedList: [Breed(), Breed()])])
    }
}
