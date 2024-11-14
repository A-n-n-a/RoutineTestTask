//
//  DetailView.swift
//  TestTask
//
//  Created by Anna on 11/14/24.
//

import SwiftUI

// Detail View for Routine Category
struct DetailView: View {
    let title: String
    @State private var selectAll = false
    @State private var selectedItems: Set<Int> = []

    var body: some View {
        VStack {
            TabView {
                ForEach(["carouselImage1", "carouselImage2"], id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 200)

            List {
                ForEach(0..<5) { index in
                    RoutineTaskView(taskTitle: "Task \(index + 1)", isSelected: selectedItems.contains(index)) {
                        if selectedItems.contains(index) {
                            selectedItems.remove(index)
                        } else {
                            selectedItems.insert(index)
                        }
                    }
                }
            }
            
            if !selectedItems.isEmpty {
                Button("Add to List") {
                    // Show "My Lists" modal
                }
                .padding()
            }
        }
        .navigationBarTitle(title, displayMode: .inline)
        .navigationBarItems(trailing: Button("Select All") {
            selectAll.toggle()
            selectedItems = selectAll ? Set(0..<5) : []
        })
    }
}
