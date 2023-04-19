//
//  Practice.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/11/23.
//

import SwiftUI

struct Practice: View {
    @State var list = [MyItem]()
    @State private var isFavorite = false
    @ObservedObject var myCount = Mytimer()
    
    var body: some View {
        VStack {
            Button {
                self.list.append(MyItem(isFavourite: true))
                self.list.append(MyItem(isFavourite: false))
                
            } label: {
                Text("Add me")
            }
            Spacer()
            Toggle(isOn: $isFavorite) {
                Text("IsFavourite")
            }.padding(20)
        
            List{
                ForEach(list.filter{$0.isFavourite == self.isFavorite}) { it in
                    HStack {
                        Text(it.name)
                        Spacer()
                        if it.isFavourite {
                            Image(systemName: "star.fill")
                        }
                    }
                }
                   
            }
            Spacer()
            
             MyView(isFavorite: $isFavorite)
            Text("\(myCount.value)")
            
        }
        
    }
}

class Mytimer: ObservableObject {
    @Published var value: Int = 1
    
    init(){
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.value += 2
        }
    }
}

struct MyView: View{
    @Binding var isFavorite: Bool
    
    var body: some View{
        Button {
            self.isFavorite.toggle()
        } label: {
            Text("Get favorite")
        }

    }
}

struct Practice_Previews: PreviewProvider {
    static var previews: some View {
        Practice()
    }
}


