//
//  HeartBeatAnimation.swift
//  SwiftUI Animations Demo
//
//  Created by Selvarajan on 29/12/24.
//

import SwiftUI

struct HeartbeatShapeSample: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        let midX = width / 2
        let midY = height / 2
        
        // Start at the bottom left corner
        path.move(to: CGPoint(x: 0, y: midY))
        
        // First upward spike (large)
        path.addLine(to: CGPoint(x: midX - width * 0.3, y: midY))
        path.addLine(to: CGPoint(x: midX - width * 0.25, y: midY - height * 0.2))
        path.addLine(to: CGPoint(x: midX - width * 0.15, y: midY + height * 0.1))
        
        // Heartbeat peak (largest)
        path.addLine(to: CGPoint(x: midX, y: midY - height * 0.5)) // tallest peak
        path.addLine(to: CGPoint(x: midX + width * 0.15, y: midY + height * 0.25)) // smooth downward slope
        
        // Third upward spike (smaller)
        path.addLine(to: CGPoint(x: midX + width * 0.25, y: midY - height * 0.2)) // smaller spike
        path.addLine(to: CGPoint(x: midX + width * 0.3, y: midY)) // back to baseline
        path.addLine(to: CGPoint(x: width, y: midY)) // final line to end
        
        return path
    }
}

struct HeartBeatAnimationSample: View {
    @State var startTrim: CGFloat = 0
    @State var endTrim: CGFloat = 0.1
    var body: some View {
        ZStack {
            HeartbeatShapeSample()
                .stroke(.indigo.opacity(0.4), lineWidth: 3)
            
            HeartbeatShapeSample()
                .trim(from: startTrim, to: endTrim)
                .stroke(.red, lineWidth: 3)
            
        }
        .frame(width: 100, height: 100)
        .scaleEffect(2)
        .onAppear {
            withAnimation(Animation.linear(duration: 1.5)
                .repeatForever(autoreverses: false)) {
                    startTrim = 1
                    endTrim = 1.1
                }
        }
    }
}

#Preview {
    HeartBeatAnimationSample()
}
