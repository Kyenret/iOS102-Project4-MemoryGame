//
//  CardView.swift
//  Memory Game
//
//  Created by Kyenret Yakubu Ayuba on 3/22/24.
//

import SwiftUI

struct CardView: View {
    let card: Card
    let isFaceDown: Bool
    let onTap: () -> Void // Add onTap closure
    //let onTap: () -> Void // Add onTap closure
    //@State private var isFaceDown = true //initial state is face down
    var body: some View {
        ZStack {
            // Card background
            RoundedRectangle(cornerRadius: 25.0)
                .fill(isFaceDown ? Color.blue : .white) // Use gray color for facedown cards .indigo)
                .shadow(color: .black, radius: 4, x: -2, y: 2)
            if !isFaceDown {
                Text(card.emoji)
                    .font(.largeTitle)
            }
        }
        .frame(width: 100, height: 150)
        .opacity(card.isMatched ? 0 : 1.0) // Dim the card if it's selected
        .onTapGesture {
            onTap() //notifying when a specific card has been tapped
//            withAnimation {
//                flipCard()
//            }
        }
        .rotation3DEffect(
            .degrees(isFaceDown ? 0 : 180),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        //.animation(.easeInOut(duration: 0.5))
    }
    // Function to flip the card
//    private func flipCard() {
//        isFaceDown.toggle()
//    }
}
// Card data model
struct Card: Equatable {
    let id = UUID()
    let emoji: String
    var isMatched: Bool = false // Add isMatched property
    var isFaceDown: Bool = true // Add isFaceDown  property
    
    static func generatePairs(count: Int) -> [Card] {
            var emojis = ["😂", "🥺", "😘", "😞", "😬", "😊", "🫣", "💕", "👀", "😑"]
            emojis = Array(emojis.prefix(count))
            emojis += emojis
            emojis.shuffle()
            
            return emojis.map { Card(emoji: $0) }
        }
//    static let mockedCards = [
//        Card(emoji: "😂"),
//        Card(emoji: "🥺"),
//        Card(emoji: "😘"),
//        Card(emoji: "😞"),
//        Card(emoji: "😬"),
//        Card(emoji: "😊"),
//        Card(emoji: "😂"),
//        Card(emoji: "🥺"),
//        Card(emoji: "😘"),
//        Card(emoji: "😞"),
//        Card(emoji: "😬"),
//        Card(emoji: "😊")
//        ]
}

//Preview {
struct CardViewPreview: PreviewProvider {
    static var previews: some View {
        let card = Card(emoji: "😊") // Create a sample card
        //return CardView(card: card, onTap: {}) // Return the CardView with the sample card
    }
}
