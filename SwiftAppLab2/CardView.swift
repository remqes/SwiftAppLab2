//
//  CardView.swift
//  SwiftAppLab2
//
//  Created by student on 27/04/2024.
//

import SwiftUI

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        
        let roundedRectangle = RoundedRectangle(cornerRadius: 12)
        
        ZStack {
            
            Group {
                roundedRectangle.fill(.white)
                roundedRectangle
                    .strokeBorder(style: StrokeStyle(lineWidth: 2))
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            roundedRectangle
                .fill(.blue)
                .opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
        
    }
}

#Preview {
    CardView(content: "🎃")
}
