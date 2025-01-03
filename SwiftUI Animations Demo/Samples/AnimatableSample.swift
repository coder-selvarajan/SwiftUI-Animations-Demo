//
//  AnimatableDemo.swift
//  SwiftUI Animations Demo
//
//  Created by Selvarajan on 26/12/24.
//

import SwiftUI

struct AnimatablePieSlice: Shape, Animatable {
    var endAngle: Double
    var startAngle: Double = 0.0
    
    // Conform to `Animatable` by specifying an animatable property
    var animatableData: Double {
        get { endAngle }
        set { endAngle = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        
        path.move(to: center)
        path.addArc(
            center: center,
            radius: radius,
            startAngle: .degrees(startAngle),
            endAngle: .degrees(endAngle),
            clockwise: false
        )
        path.closeSubpath()
        
        return path
    }
}

struct AnimatablePieSample: View {
    @State private var endAngle: Double = 0.0
    @State private var showAnimation = false
    
    var body: some View {
        VStack {
            Text("Animatable Protocol Demo")
                .font(.title)
                .fontWeight(.semibold)

            Spacer()
            
            AnimatablePieSlice(endAngle: endAngle)
                .fill(Color.cyan)
                .frame(width: 200, height: 200)
                .onAppear {
                    withAnimation(.easeInOut(duration: 2.0)) {
                        endAngle = 360
                    }
                }
            
            Spacer()
            
            Button("Restart Animation") {
                endAngle = 0
                withAnimation(.easeInOut(duration: 2.0)) {
                    endAngle = 360
                }
            }
            .padding()
            .background(Color.indigo)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    AnimatablePieSample()
}
