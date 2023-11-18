//
//  ContentView.swift
//  Memoize
//
//  Created by Дмирий Зядик on 18.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .padding(20)
        .foregroundColor(.orange)
        
    }
}

struct CardView : View {
    var isFaceUp: Bool = false
   
    var body: some View {
        ZStack(content:
         {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder( lineWidth: 2)
                Text("🐦").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12).foregroundColor(.orange)
            }
        })
        
    }
}

#Preview {
    ContentView()
}
