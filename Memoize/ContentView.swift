//
//  ContentView.swift
//  Memoize
//
//  Created by Дмирий Зядик on 18.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        let emoji: [String] = ["🐦", "🐧", "🐤", "🐔"]

        HStack{
            ForEach(emoji.indices, id: \.self) {
                index in CardView(content: emoji[index], isFaceUp: true)
            }
            //            Text("\(1) fileodDir \(5)")
        }
        .padding(20)
        .foregroundColor(.orange)
        
    }
}

struct CardView : View {
    var content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let base  = RoundedRectangle(cornerRadius: 12, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder( lineWidth: 2)
                Text(content).font(.largeTitle)
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
