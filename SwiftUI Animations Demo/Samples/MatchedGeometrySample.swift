//
//  MatchedGeometryExample.swift
//  SwiftUI Animations Demo
//
//  Created by Selvarajan on 01/01/25.
//

import SwiftUI

struct MatchedGeometrySample: View {
    @Namespace private var animation
    @State private var selectedTab: Tab = .home
    
    enum Tab: String, CaseIterable {
        case home = "Home"
        case search = "Search"
        case profile = "Profile"
    }
    var body: some View {
        VStack {
            Text("MatchedGeometryEffect Demo")
                .font(.title2)
                .padding()
            Spacer()
            HStack {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Button(action: {
                        withAnimation(.spring()) {
                            selectedTab = tab
                        }
                    }) {
                        Text(tab.rawValue)
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(selectedTab == tab ? .white : .gray)
                            .background(
                                ZStack {
                                    if selectedTab == tab {
                                        RoundedRectangle(cornerRadius: 15.0)
                                            .fill(Color.blue)
                                            .matchedGeometryEffect(id: "background", in: animation)
                                    }
                                }
                            )
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(Color(UIColor.systemGray6))
        }
    }
}

struct MatchedGeometrySample_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometrySample()
    }
}
