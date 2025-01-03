//
//  ViewTransitionDemo.swift
//  SwiftUI Animations Demo
//
//  Created by Selvarajan on 24/12/24.
//

import SwiftUI

struct ViewTransitionSample: View {
    @State private var currentIndex: Int = 0
    private let foodEmojis = ["🥗", "🍛", "🍲", "🍱", "🥙"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("View Transition Demo")
                .font(.title)
                .fontWeight(.semibold)

            Spacer()

            ZStack {
                ForEach(foodEmojis.indices, id: \.self) { index in
                    if index == currentIndex {
                        Text(foodEmojis[index])
                            .font(.system(size: 200))
                            .padding(.horizontal, 50)
                            .transition(.slide)
                    }
                }
            }
            .animation(.easeInOut, value: currentIndex)

            Spacer()
            
            Button(action: {
                currentIndex = (currentIndex + 1) % foodEmojis.count
            }) {
                Text("Next Food Item")
                    .font(.title2)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.indigo)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    ViewTransitionSample()
}
