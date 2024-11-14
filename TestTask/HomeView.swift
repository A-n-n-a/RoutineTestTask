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
            VStack {
                ScrollView {
                    VStack {
                        RoutineCategoryView(category: "DETAILED MORNING ROUTINE TASKS", imageName: "morning")
                        RoutineCategoryView(category: "DAILY WORKDAY FOCUS GOALS", imageName: "daily")
                        RoutineCategoryView(category: "EVENING WIND-DOWN ROUTINE", imageName: "evening")
                        RoutineCategoryView(category: "COMPREHENSIVE SLEEP ROUTINE", imageName: "sleep")
                    }
                }
                Spacer()
                CustomTabBar()
            }
            .navigationTitle("Home")
        }
    }
}


