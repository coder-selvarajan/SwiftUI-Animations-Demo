//
//  LottieAnimationDemo.swift
//  SwiftUI Animations Demo
//
//  Created by Selvarajan on 04/01/25.
//

import SwiftUI
import Lottie

struct LottieAnimationDemo: View {
    @State var animate: Bool = false
    var body: some View {
        VStack {
            Spacer()
            
            if animate {
                LottieView(animation: .named("Tick.json"))
                    .playbackMode(.playing(.toProgress(1, loopMode: .playOnce)))
            }
            Spacer()

            Button {
                animate.toggle()
                
            } label: {
                Text("Animate")
                    .font(.largeTitle)
            }

        }
    }
}

#Preview {
    LottieAnimationDemo()
}
