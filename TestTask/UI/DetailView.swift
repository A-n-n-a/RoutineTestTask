//
//  DetailView.swift
//  TestTask
//
//  Created by Anna on 11/14/24.
//

import SwiftUI

struct DetailView: View {
    let category: Category
    @State private var selectAll = false
    @State private var selectedItems: Set<Int> = []

    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(Array(0..<category.tasks.count), id: \.self) { index in
                            RoutineTaskView(task: category.tasks[index], isSelected: selectedItems.contains(index)) {
                            if selectedItems.contains(index) {
                                selectedItems.remove(index)
                            } else {
                                selectedItems.insert(index)
                            }
                        }
                        .background(Color.white)
                        .padding(.horizontal, 16)
                    }
                }
            }
            .padding(.vertical, 12)
            
            if !selectedItems.isEmpty {
                Button("Add to List") {
                    // TODO: Show "My Lists" modal
                }
                .padding()
            }
        }
        .navigationBarTitle(category.title, displayMode: .inline)
        .navigationBarItems(trailing: Button("Select All") {
            selectAll.toggle()
            selectedItems = selectAll ? Set(0..<5) : []
        })
    }
}
