//
//  ReduceMotionConfigSample.swift
//  SwiftUI Animations Demo
//
//  Created by Selvarajan on 03/01/25.
//

import SwiftUI

struct motionAnimationModifier<V: Equatable>: ViewModifier {
    let animation: Animation?
    let value: V
    
    func body(content: Content) -> some View {
        if UIAccessibility.isReduceMotionEnabled {
            content
        } else {
            content
                .animation(animation, value: value)
        }
    }
}

extension View {
    func motionAnimation<V: Equatable>(_ animation: Animation?, value: V) -> some View {
        self.modifier(motionAnimationModifier(animation: animation, value: value))
    }
}

struct ReduceMotionConfigSample: View {
    @State var animate : Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Circle()
                .fill(.indigo)
                .frame(width: 100)
                .offset(x: animate ? 120: -120)
                .motionAnimation(.default, value: animate)
            
            Spacer()
            
            Button {
                animate.toggle()
            } label: {
                Text("Animate")
                    .font(.title)
            }

        }
    }
}

#Preview {
    ReduceMotionConfigSample()
}
