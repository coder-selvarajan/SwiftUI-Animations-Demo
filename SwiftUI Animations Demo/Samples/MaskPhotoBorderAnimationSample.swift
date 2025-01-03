//
//  BorderAnimation.swift
//  SwiftUI Animations Demo
//
//  Created by Selvarajan on 29/12/24.
//

import SwiftUI

struct MaskPhotoBorderAnimationSample: View {
    let CardColor:Color = Color.black
    let BorderColor:Color = Color.red
    @State var  rotation:CGFloat = 0
    
    var body: some View {
        ZStack{
            Color.gray.opacity(0.3).ignoresSafeArea()
            
            ZStack{
                Image("steve")
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 200, height:250)
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
                
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 400 , height: 170)
                    .rotationEffect(.degrees(rotation))
                    .mask {
                        RoundedRectangle(cornerRadius: 19, style: .continuous)
                            .stroke(lineWidth: 3)
                            .frame(width: 200, height: 250)
                        
                    }
                    .foregroundStyle(
                        LinearGradient(gradient: Gradient(colors: [BorderColor.opacity(0.0),
                                                                   BorderColor,BorderColor,
                                                                   BorderColor.opacity(0.0)]),
                                       startPoint: .top, endPoint: .bottom))
            }
            .frame(width: 260, height: 340)
            
            VStack {
                Button {
                    withAnimation(.linear(duration: 6).repeatForever(autoreverses: false)){
                        rotation = 360
                    }
                } label: {
                    Text("Animate")
                        .foregroundStyle(.indigo)
                        .font(.largeTitle)
                }.offset(y: 300)
            }

        }
    }
}

#Preview {
    MaskPhotoBorderAnimationSample()
}
