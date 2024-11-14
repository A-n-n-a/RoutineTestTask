//
//  CustomTabBar.swift
//  TestTask
//
//  Created by Anna on 11/14/24.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            Spacer()
            ForEach(Tab.allCases, id: \.self) { tab in
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        selectedTab = tab
                    }
                }) {
                    Image(tab.imageName)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(selectedTab == tab ? .white : .black)
                        .padding()
                        .background(
                            Circle()
                                .fill(Color("blue_0C8CE9"))
                                .frame(width: 50, height: 50)
                                .opacity(selectedTab == tab ? 1 : 0)
                        )
                }
                Spacer()
            }
        }
        .frame(width: 250, height: 64)
        .background(Color("blue_0C8CE9").opacity(0.3))
        .cornerRadius(32)
    }
}

enum Tab: String, CaseIterable {
    case home
    case list
    case user
    
    var imageName: String {
        switch self {
        case .home: return "home"
        case .list: return "list"
        case .user: return "user"
        }
    }
}
