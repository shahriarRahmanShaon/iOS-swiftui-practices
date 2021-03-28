//
//  ContentView.swift
//  iOS swiftui practices
//
//  Created by sergio shaon on 27/3/21.
//

import SwiftUI


struct ContentView: View {
    @State var place = "dhaka"
    @ObservedObject var ViewModel = viewModel()
    
    var body: some View{
        VStack {
            TextField("place name...", text: $place)
            Text("start networking")
                .onTapGesture {
                    let url =
                        URL( string:
                                "https://api.openweathermap.org/data/2.5/weather?q=\(place)&appid=0e467e5c6beceddf2be0be537b297025")
                    ViewModel.networking(url!)
                }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
