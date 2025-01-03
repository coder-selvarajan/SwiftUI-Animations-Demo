//
//  ContentView.swift
//  SwiftUI Animations Demo
//
//  Created by Selvarajan on 24/12/24.
//

import SwiftUI

struct ImplicitAnimationSample: View {
    @State private var isRotated = false
    
    var body: some View {
        VStack(spacing: 75) {
            Text("Implicit Animation")
                .font(.title).fontWeight(.semibold)
            
            Spacer()
            
            Image(systemName: "arrow.2.circlepath")
                .resizable()
                .frame(width: 120, height: 100)
                .rotationEffect(.degrees(isRotated ? 360 : 0))
                .animation(.easeInOut(duration: 1), value: isRotated)
            
            Button(action: {
                isRotated.toggle()
            }) {
                Text("Rotate")
                    .font(.title)
                    .padding()
                    .background(Color.indigo)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ImplicitAnimationSample()
}
