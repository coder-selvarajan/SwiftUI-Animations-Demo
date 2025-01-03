//
//  ScoreCardAnimationSample.swift
//  SwiftUI Animations Demo
//
//  Created by Selvarajan on 03/01/25.
//

import SwiftUI

struct ExplicitScoreCardAnimationSample: View {
    @State private var score: Int = 0
    @State private var isAnimated: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Score Card")
                .font(.title)
                .bold()
            
            Text("\(score)")
                .font(.system(size: 100, weight: .bold, design: .rounded))
                .foregroundColor(isAnimated ? .red : .blue)
                .scaleEffect(isAnimated ? 1.2 : 1.0)
                .rotationEffect(Angle(degrees: isAnimated ? -10 : 0))
            
            Button {
                score += 1
                if score % 5 == 0 {
                    withAnimation {
                        isAnimated = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        withAnimation {
                            isAnimated = false
                        }
                    }
                }
            } label: {
                Text("Increase Score")
                    .font(.title)
                    .bold()
                    .padding()
                    .foregroundColor(.indigo)
            }

        }
        .padding()
    }
    
    private func incrementScore() {
        
    }
}

#Preview {
    ExplicitScoreCardAnimationSample()
}
