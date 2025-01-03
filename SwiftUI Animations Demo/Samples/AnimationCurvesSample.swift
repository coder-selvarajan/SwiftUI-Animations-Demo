//
//  AnimationCurvesDemo.swift
//  SwiftUI Animations Demo
//
//  Created by Selvarajan on 02/01/25.
//

import SwiftUI

struct AnimationCurvesSample: View {
    @State private var animate: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {
                    animate.toggle()
                }) {
                    Text("Animate")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Capsule().fill(Color.indigo))
                }
            }
            .background(Color(.systemBackground))
            .zIndex(1)
            .padding(.vertical, 30)
            Spacer(minLength: 20)
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    animationExample(animation: .easeIn, label: "Ease In")
                    animationExample(animation: .easeOut, label: "Ease Out")
                    animationExample(animation: .easeInOut, label: "Ease In-Out")
                    animationExample(animation: .linear, label: "Linear")
                    animationExample(animation: .spring(), label: "Spring")
                    animationExample(animation: .interpolatingSpring(stiffness: 100, damping: 10), label: "Interpolated Spring")
                    animationExample(animation: .bouncy, label: "Bouncy")
                    animationExample(animation: .snappy, label: "Snappy")
                    animationExample(animation: .smooth, label: "Smooth")
                }
                .padding()
            }
        }
        .padding(.horizontal)
    }
    
    private func animationExample(animation: Animation, label: String) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Spacer()
                Text(label)
                    .font(.title2)
                Spacer()
            }
            Circle()
                .fill(Color.indigo)
                .frame(width: 40, height: 40)
                .offset(x: animate ? 300 : 0)
                .animation(animation.speed(1), value: animate)
            
            Divider().background(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    AnimationCurvesSample()
}
