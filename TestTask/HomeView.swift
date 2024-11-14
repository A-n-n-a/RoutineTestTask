//
//  HomeView.swift
//  TestTask
//
//  Created by Anna on 11/14/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                CustomNavBar(title: "Home")
                
                ScrollView {
                    VStack(spacing: 16) {
                        RoutineCategoryView(category: "DETAILED MORNING ROUTINE TASKS", imageName: "morning")
                        RoutineCategoryView(category: "DAILY WORKDAY FOCUS GOALS AND TASKS TO KEEP YOU ON TRACK", imageName: "daily")
                        RoutineCategoryView(category: "EVENING WIND-DOWN ROUTINE STEPS", imageName: "evening")
                        RoutineCategoryView(category: "COMPREHENSIVE SLEEP ROUTINE GOALS", imageName: "sleep")
                    }
                }
                Spacer()
                CustomTabBar()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
