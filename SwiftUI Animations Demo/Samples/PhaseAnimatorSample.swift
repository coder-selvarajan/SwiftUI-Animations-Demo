//
//  PhaseAnimatorDemo.swift
//  SwiftUI Animations Demo
//
//  Created by Selvarajan on 04/01/25.
//

import SwiftUI

struct PhaseAnimatorSample: View {
    @State var animate: Bool = false
    
    var body: some View {
        VStack {
            Text("Hello World")
                .phaseAnimator([1, 2, 3], trigger: animate) { content, phase in
                    content
                        .foregroundStyle(phase == 1 ? .blue : phase == 2 ?.red : .green)
                        .scaleEffect((phase == 2) ? 1.2: phase == 1 ? 1 : 2)
                } animation: { phase in
                        .bouncy(duration: 0.5)
                }
                .font(.largeTitle)
            
            Spacer()
            
            Button {
                animate.toggle()
            } label: {
                Text("Animate")
                    .font(.largeTitle)
            }
        }
        .padding(30)
    }
}

#Preview {
    PhaseAnimatorSample()
}
