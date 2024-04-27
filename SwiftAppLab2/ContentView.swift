//
//  ContentView.swift
//  SwiftAppLab2
//
//  Created by student on 27/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State var cardCounter: Int = 2
    let emojisFaces: Array<String> = ["🥹", "🙂", "😁", "🤒", "😵", "😦", "🤩", "😳", "😵‍💫", "🫨"]
    let emojisAnimals: Array<String> = ["🦣", "🐁", "🦉", "🦧", "🐈", "🦚", "🦢", "🐥", "🐋", "🐊"]
    let emojisOther: Array<String> = ["🕸️", "🥝", "🥦", "🥩", "🥨", "🥫", "🥕", "🥑", "🥥", "🧅"]
    
    //BODY
    var body: some View {
        
        cardDisplay
        buttonsView
        
    }
    
    var buttonsView: some View {
        HStack {
            adjustCardNumber(by: 2, symbol: "plus.square.fill")
                .padding()
            Spacer()
            adjustCardNumber(by: -2, symbol: "minus.square.fill")
                .padding()
        }
    }
    
    var cardDisplay: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 160))
            ]) {
                ForEach(0 ..< cardCounter, id: \.self) {
                    i in CardView(content: emojisFaces[i])
                }
            }
            .foregroundColor(.blue)
            .padding()
        }
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        Button(
            action: {
                cardCounter += offset
            }, 
            label: {
                Image(systemName: symbol).font(.largeTitle)
            })
        .disabled(
            cardCounter + offset < 2 || 
            cardCounter + offset > emojisFaces.count
        )
    }
}

#Preview {
    ContentView()
}
