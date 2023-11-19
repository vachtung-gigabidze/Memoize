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
            CardView(isFaceUp: true)
            CardView()
//            Text("\(1) fileodDir \(5)")
        }
        .padding(20)
        .foregroundColor(.orange)
        
    }
}

struct CardView : View {
    @State var isFaceUp: Bool = false
   
    var body: some View {
        ZStack {
            let base  = RoundedRectangle(cornerRadius: 12, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder( lineWidth: 2)
                Text("🐦").font(.largeTitle)
            } else {
                base.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}

#Preview {
    ContentView()
}
