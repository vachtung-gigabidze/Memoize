//
//  MemoizeApp.swift
//  Memoize
//
//  Created by Дмирий Зядик on 18.11.2023.
//

import SwiftUI

@main
struct MemoizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
