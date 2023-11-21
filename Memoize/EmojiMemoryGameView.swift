//
//  EmojiMemoryGameView.swift
//  Memoize
//
//  Created by Дмирий Зядик on 18.11.2023.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame    
    
    var body: some  View {
        VStack {
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0){
            ForEach(viewModel.cards) {
                card in CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
        }//            Text("\(1) fileodDir \(5)")
    }.foregroundColor(.orange)
    }
}

struct CardView : View {
    var card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base  = RoundedRectangle(cornerRadius: 12, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder( lineWidth: 2)
                Text(card.content).font(.system(size: 200)).minimumScaleFactor(0.01).aspectRatio(1, contentMode: .fit)
            }.opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
            
        }.opacity(card.isFaceUp || !card.isMatched ? 1 : 0)//.onTapGesture {
          // card.isFaceUp.toggle()
        }
        
    
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
