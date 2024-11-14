//
//  DetailView.swift
//  TestTask
//
//  Created by Anna on 11/14/24.
//

import SwiftUI

struct CategoryDetailView: View {
    let category: Category
    @State private var selectAll = false
    @State private var selectedItems: Set<Int> = []

    var body: some View {
        VStack {
            VStack(spacing: 0) {
                
                HStack {
                    Text(category.subtitle)
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(Color("text_1F2024"))
                        .padding(.leading, 20)
                    Spacer()
                }
                .frame(height: 63)
                
                Rectangle()
                    .fill(Color("gray_D0D0D0").opacity(0.2))
                    .frame(height: 2)
                    .padding(.leading, 20)
                    .padding(.trailing, 30)
                    .padding(.bottom, 20)
            }
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
