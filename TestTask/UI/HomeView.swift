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
                
                CustomSimpleNavBar(title: "Home")
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(categories, id: \.title) { category in
                            RoutineCategoryView(category: category)
                        }
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
    
    var categories: [Category] {
        return [
            Category(title: "DETAILED MORNING ROUTINE TASKS", subtitle: "Wake-Up and Hydration", imageName: "morning", tasks: tasks),
            Category(title: "DAILY WORKDAY FOCUS GOALS AND TASKS TO KEEP YOU ON TRACK", subtitle: "Wake-Up and Hydration", imageName: "daily", tasks: tasks),
            Category(title: "EVENING WIND-DOWN ROUTINE STEPS", subtitle: "Wake-Up and Hydration", imageName: "evening", tasks: tasks),
            Category(title: "COMPREHENSIVE SLEEP ROUTINE GOALS", subtitle: "Wake-Up and Hydration", imageName: "sleep", tasks: tasks)
        ]
    }
    
    var tasks: [Task] {
        return [
            Task(title: "Drink a Glass of Water", description: "Start with a full glass to rehydrate after sleep", tags: "Hydration, Health", images: ["carouselImage1", "carouselImage2"]),
            Task(title: "Deep Breathing Exercise", description: "Practice deep breathing for 5 minutes", tags: "Breathing, Mindfulness, Calm"),
            Task(title: "10-15 minutes of light exercise to energize"),
            Task(title: "Short Walk or Jog", description: "Go outside for fresh air and movement", tags: "Outdoor, Movement")
        ]
    }
}

#Preview {
    HomeView()
}
