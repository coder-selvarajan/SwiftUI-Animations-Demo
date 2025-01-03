//
//  TriggerButtonDemo.swift
//  SwiftUI Animations Demo
//
//  Created by Selvarajan on 24/12/24.
//

import SwiftUI

struct TriggerButtonSample: View {
    @State var showButtons: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color.white.edgesIgnoringSafeArea(.all)
            Group {
                Button(action: {
                    showButtons.toggle()
                }) {
                    Image(systemName: "bag.badge.plus")
                        .padding()
                        .rotationEffect(Angle.degrees(showButtons ? 0 : -60))
                }
                .background(Circle().fill(.indigo).shadow(radius: 8, x: 4, y: 4))
                .opacity(showButtons ? 1 : 0)
                .offset(x: 0, y: showButtons ? -150 : 0)
                
                
                Button(action: {
                    showButtons.toggle()
                }) {
                    Image(systemName: "gauge.badge.plus")
                        .padding()
                        .rotationEffect(Angle.degrees(showButtons ? 0 : 90))
                }
                .background(Circle().fill(.indigo).shadow(radius: 8, x: 4, y: 4))
                .opacity(showButtons ? 1 : 0)
                .offset(x: showButtons ? -110 : 0, y: showButtons ? -110 : 0)
                
                Button(action: {
                    showButtons.toggle()
                }) {
                    Image(systemName: "calendar.badge.plus")
                        .padding()
                        .rotationEffect(Angle.degrees(showButtons ? 0 : 60))
                }
                .background(Circle().fill(.indigo).shadow(radius: 8, x: 4, y: 4))
                .opacity(showButtons ? 1 : 0)
                .offset(x: showButtons ? -150 : 0, y: 0)

                
                Button(action: {
                    showButtons.toggle()
                }) {
                    Image(systemName: "plus")
                        .padding()
                        .rotationEffect(Angle.degrees(showButtons ? 45 : 0))
                }
                .background(Circle().fill(.indigo).shadow(radius: 8, x: 4, y: 4))
            }
            .padding(.trailing, 20)
            .tint(.white)
            .animation(.default, value: showButtons)
            
        }
        .font(.title)
    }
}

#Preview {
    TriggerButtonSample()
}
