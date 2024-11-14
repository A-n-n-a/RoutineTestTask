//
//  RoutineTaskView.swift
//  TestTask
//
//  Created by Anna on 11/14/24.
//

import SwiftUI

struct RoutineTaskView: View {
    let task: Task
    let isSelected: Bool
    let onToggleSelect: () -> Void
    @State private var selectedImage = 0
    
    var width: CGFloat {
        UIScreen.main.bounds.width - 30
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if let images = task.images {
                TabView(selection: $selectedImage) {
                    ForEach(images, id: \.self) { image in
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .clipped()
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: (task.images == nil ? 0 : (width * 0.65)))
                .overlay(
                    HStack(spacing: 8) {
                        ForEach(0..<images.count, id: \.self) { index in
                            Circle()
                                .fill(index == selectedImage ? Color("blue_0C8CE9") : Color.white.opacity(0.4))
                                .frame(width: 8, height: 8)
                        }
                    }
                        .padding(.leading, 20)
                        .padding(.bottom,  22),
                    alignment: .bottomLeading
                )
            }
            
            HStack(alignment: .top, spacing: 13) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(task.title)
                        .font(.custom("Cardo-Regular", size: 18))
                        .foregroundColor(Color("text_0C0F39"))
                    
                    if let description = task.description {
                        Text(description)
                            .font(.custom("OpenSans-Italic", size: 14))
                            .foregroundColor(Color("text_575767"))
                    }
                    
                    if let tags = task.tags {
                        Text(tags)
                            .font(.custom("OpenSans-Regular", size: 14))
                            .foregroundColor(Color("blue_0C8CE9"))
                    }
                }
                .padding(.leading, 16)
                .padding(.top, 16)
                .padding(.bottom, 16)
                
                Spacer()
                
                Button(action: onToggleSelect) {
                    Image(systemName: isSelected ? "checkmark.circle.fill" : "plus.circle")
                        .foregroundColor(isSelected ? .blue : .gray)
                        .imageScale(.large)
                }
                .padding(.top, 16)
                .padding(.trailing, 16)
            }
        }
        .frame(width: width)
        .background(Color("background_FFFCFC"))
        .cornerRadius(20)
        .shadow(color: Color("shadow_0C0C0D").opacity(0.1), radius: 32, x: 0, y: 0)
    }
}
