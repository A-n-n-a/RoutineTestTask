//
//  RoutineTaskView.swift
//  TestTask
//
//  Created by Anna on 11/14/24.
//

import SwiftUI

struct RoutineTaskView: View {
    //TODO: create model
    let taskTitle: String
    let isSelected: Bool
    let onToggleSelect: () -> Void
    @State private var selectedImage = 0
    let images = ["carouselImage1", "carouselImage2"]
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedImage) {
                //TODO: handle warning
                ForEach(0..<images.count) { index in
                    Image(images[index])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .clipped()
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: (UIScreen.main.bounds.width - 30) * 0.65)
            .overlay(
                HStack {
                    ForEach(0..<images.count, id: \.self) { index in
                        Circle()
                            .fill(index == selectedImage ? Color("blue_0C8CE9") : Color.white.opacity(0.4))
                            .frame(width: 8, height: 8)
                    }
                    .padding(.leading, 20)
                }
                    .padding(.bottom, 22),
                alignment: .bottomLeading
            )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(taskTitle)
                    .font(.headline)
                
                Text("Start with a full glass to rehydrate after sleep")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack {
                    Text("Hydration").font(.caption).foregroundColor(.blue)
                    Text("Health").font(.caption).foregroundColor(.blue)
                }
            }
            
            Spacer()
            
            Button(action: onToggleSelect) {
                Image(systemName: isSelected ? "checkmark.circle.fill" : "plus.circle")
                    .foregroundColor(isSelected ? .blue : .gray)
                    .imageScale(.large)
            }
        }
        .background(Color("background_FFFCFC"))
        .cornerRadius(20)
        .shadow(color: Color("shadow_0C0C0D").opacity(0.1), radius: 32, x: 0, y: 0)
    }
}
