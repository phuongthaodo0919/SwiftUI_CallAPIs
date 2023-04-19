//
//  WeatherView.swift
//  BreedDog.SwiftUI
//
//  Created by Salmdo on 4/17/23.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var weatherVM: WeatherViewModel
    
    init(){
        weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        VStack {
            TextField("Enter city name", text:
                        $weatherVM.cityName){
                weatherVM.search()
            }
            Text(weatherVM.feelLike)
            
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
