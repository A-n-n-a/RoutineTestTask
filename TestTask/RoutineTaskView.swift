//
//  RoutineTaskView.swift
//  TestTask
//
//  Created by Anna on 11/14/24.
//

import SwiftUI

struct RoutineTaskView: View {
    let taskTitle: String
    let isSelected: Bool
    let onToggleSelect: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
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
        .padding()
        .background(Color.blue.opacity(0.05))
        .cornerRadius(8)
    }
}
