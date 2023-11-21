//
//  MemorizeGame.swift
//  Memoize
//
//  Created by Дмирий Зядик on 19.11.2023.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)-> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    var indexOfThenAndOnlyFaceCard: Int? {
        get {
            return  cards.indices.filter { index in cards[index].isFaceUp }.only            
        }
        set {
            cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0)}
        }
    }
    
    mutating func choose(_ card: Card){
        if let choosenIndex = cards.firstIndex(where: {$0.id == card.id }){
            if !cards[choosenIndex].isFaceUp && !cards[choosenIndex].isMatched {
                if let potentialMatchIndex = indexOfThenAndOnlyFaceCard {
                    if cards[choosenIndex].content == cards[potentialMatchIndex].content {
                        cards[choosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                    
                } else {
                    indexOfThenAndOnlyFaceCard = choosenIndex
                }
                cards[choosenIndex].isFaceUp = true
            }
        }
    }
    
    private func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
    
    struct Card : Equatable, Identifiable, CustomDebugStringConvertible {
        
         var isFaceUp = false
        var isMatched = false
        var content: CardContent
        
        var id: String
        
        var debugDescription: String {
            return "\(id): \(content)"
        }
    }
}


extension Array {
    var only : Element? {
        count == 1 ? first : nil
    }
}
