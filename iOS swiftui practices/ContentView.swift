//
//  ContentView.swift
//  iOS swiftui practices
//
//  Created by sergio shaon on 27/3/21.
//

import SwiftUI


struct ContentView: View {
    @StateObject var ViewModel = viewModel()
    @State var place = "dhaka"
    
    var body: some View{
        VStack {
            TextField("place name...", text: $place)
            Text("start networking")
                .onTapGesture {
                   // ViewModel.networkingWith_UrlSession(place)
                    ViewModel.networkingWith_combine(place)
                    
                }
            Text(String(ViewModel.mainModel?.coord.lon ?? 0.0)) // by making that optional i have to use everywhere forced unwraped version of that optional
           
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
