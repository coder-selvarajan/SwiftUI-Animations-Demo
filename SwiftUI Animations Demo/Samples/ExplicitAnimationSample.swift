//
//  ExplicitAnimationDemo.swift
//  SwiftUI Animations Demo
//
//  Created by Selvarajan on 24/12/24.
//

import SwiftUI

struct ExplicitAnimationSample: View {
    @State private var isExpanded = false
    @State private var isConditionMet = false
    
    var body: some View {
        VStack(spacing: 50) {
            Text("Explicit Animation")
                .font(.title).fontWeight(.semibold)
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.indigo)
                .frame(width: isExpanded ? 300 : 100, height: 100)
            
            Toggle("Enable Animation", isOn: $isConditionMet)
                .padding(.horizontal, 50)
            
            Button("Toggle Size") {
                // Animate only if the condition is met
                if isConditionMet {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isExpanded.toggle()
                    }
                } else {
                    isExpanded.toggle()
                }
            }
            .padding()
            .background(Color.indigo)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ExplicitAnimationSample()
}
