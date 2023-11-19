//
//  ContentView.swift
//  Memoize
//
//  Created by Дмирий Зядик on 18.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State var cardCount : Int = 4
    let emoji: [String] = ["🐦", "🐧", "🐤", "🐔","🐦", "🐧", "🐤", "🐔","🐦", "🐧", "🐤", "🐔"]
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cardCountAdjusters : some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }.imageScale(.large).font(.largeTitle)
    }
    
    func cardCounterAdjusters(by offset: Int, symbol: String) -> some View {
        Button(action: {
                cardCount += offset
        }, label: { Image(systemName: symbol)
        }).disabled(cardCount + offset < 1 || cardCount + offset > emoji.count)
    }
    
    var cardRemover : some View {
        return cardCounterAdjusters(by: -1,symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder : some View { 
        return cardCounterAdjusters(by: 1,symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount, id: \.self) {
                index in CardView(content: emoji[index]).aspectRatio(2/3, contentMode: .fit)
        }//            Text("\(1) fileodDir \(5)")
    }.foregroundColor(.orange)
    }
}

struct CardView : View {
    var content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let base  = RoundedRectangle(cornerRadius: 12, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder( lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}

#Preview {
    ContentView()
}
