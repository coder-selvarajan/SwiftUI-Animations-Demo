//
//  DraggableCircleSample.swift
//  SwiftUI Animations Demo
//
//  Created by Selvarajan on 03/01/25.
//

import SwiftUI

struct DraggableCircleSample: View {
    @State private var offset: CGSize = .zero
    @State private var isDragging: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                Circle()
                    .fill(isDragging ? Color.green : Color.blue)
                    .frame(width: 100, height: 100)
                    .scaleEffect(isDragging ? 1.2 : 1.0)
                    .offset(offset)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                isDragging = true
                                offset = gesture.translation
                            }
                            .onEnded { _ in
                                withAnimation(.bouncy) {
                                    offset = .zero
                                    isDragging = false
                                }
                            }
                    )
                
                Spacer()
                Text("Drag the circle around!")
                    .font(.headline)
                    .foregroundColor(.gray)
                Spacer()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

#Preview {
    DraggableCircleSample()
}
