//
//  SwiftUIView.swift
//  iOS swiftui practices
//
//  Created by sergio shaon on 30/3/21.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Badge: View {
    let text: String
    let imageName: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
            Text(text)
        }
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
