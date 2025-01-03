//
//  CustomTimingCurveSample.swift
//  SwiftUI Animations Demo
//
//  Created by Selvarajan on 03/01/25.
//

import SwiftUI

extension Animation {
    static var customAnim: Animation {
        Animation.timingCurve(1,0.04,0,0.99)
    }
    
    static func customAnim(duration: TimeInterval) -> Animation {
        Animation.timingCurve(0, 1, 1, 0, duration: duration)
    }
}

struct CustomTimingCurveSample: View {
    @State var animate: Bool = false
    var body: some View {
        VStack {
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 100, height: 100)
                .offset(x: animate ? 120: -120)
                .animation(.customAnim.repeatCount(4), value: animate)
            
        }
        .onAppear(){
            animate.toggle()
        }
    }
}

#Preview {
    CustomTimingCurveSample()
}
