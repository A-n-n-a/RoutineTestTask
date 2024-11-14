//
//  DetailView.swift
//  TestTask
//
//  Created by Anna on 11/14/24.
//

import SwiftUI

struct DetailView: View {
    let title: String
    @State private var selectAll = false
    @State private var selectedItems: Set<Int> = []

    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(0..<5) { index in
                        RoutineTaskView(taskTitle: "Task \(index + 1)", isSelected: selectedItems.contains(index)) {
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
        .navigationBarTitle(title, displayMode: .inline)
        .navigationBarItems(trailing: Button("Select All") {
            selectAll.toggle()
            selectedItems = selectAll ? Set(0..<5) : []
        })
    }
}
