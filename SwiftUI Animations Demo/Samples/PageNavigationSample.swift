//
//  PageNavigationSample.swift
//  SwiftUI Animations Demo
//
//  Created by Selvarajan on 03/01/25.
//

import SwiftUI

struct PageNavigationSample: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("First Page")
                    .font(.largeTitle)
                    .bold()
                
                NavigationLink(destination: SecondPageView()) {
                    Text("Go to Second Page")
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                }
            }
            .padding()
        }
    }
}

struct SecondPageView: View {
    @State private var showContent: Bool = false
    
    var body: some View {
        VStack {
            if showContent {
                Text("Second Page")
                    .font(.largeTitle)
                    .bold()
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.5)) {
                showContent = true
            }
        }
        .onDisappear {
            withAnimation {
                showContent = false
            }
        }
    }
}

#Preview {
    PageNavigationSample()
}
