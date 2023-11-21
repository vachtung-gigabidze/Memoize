//
//  EmojiMemoryGame.swift
//  Memoize
//
//  Created by Дмирий Зядик on 19.11.2023.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    private static let emoji = ["🐦", "🐧", "🐤", "🐔", "🦉", "🦇", "🦆", "🪿"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 8) {pairIndex in
            if emoji.indices.contains(pairIndex){
                return emoji[pairIndex]
            } else {
                return "❗️"
            }
        }
    }    
    
    @Published private var model  = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    //MARK: - Intents
    
    func shuffle(){
        model.shuffle()
        objectWillChange.send()
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
