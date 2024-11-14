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
    @State private var isModalPresented = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                VStack(spacing: 0) {
                    
                    CustomNavBar(title: category.title) {
                        presentationMode.wrappedValue.dismiss()
                    } onSelectAllAction: {
                        selectAll.toggle()
                        selectedItems = selectAll ? Set(0..<category.tasks.count) : []
                    }
                    
                    HStack {
                        Text(category.subtitle)
                            .font(.custom("Cardo-Regular", size: 28))
                            .foregroundColor(Color("text_0C0F39"))
                            .padding(.leading, 20)
                        Spacer()
                    }
                    .frame(height: 62)
                    
                    Rectangle()
                        .fill(Color("gray_D0D0D0").opacity(0.2))
                        .frame(height: 2)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
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
                            .background(Color("white_FFFFFF"))
                            .padding(.horizontal, 16)
                        }
                    }
                    .padding(.vertical, 12)
                }
                .overlay(
                    
                    Group {
                        if !selectedItems.isEmpty {
                            Button(action: {
                                isModalPresented = true
                            }) {
                                HStack {
                                    Image(systemName: "plus")
                                        .resizable()
                                        .frame(width: 23, height: 23)
                                        .padding(.leading, 20)
                                    
                                    Text("ADD TO LIST")
                                        .font(.custom("Karl-Regular", size: 14))
                                        .padding(.trailing, 20)
                                }
                                .foregroundColor(.white)
                                .frame(height: 58)
                                .padding(.horizontal, 20)
                                .background(Color("blue_0C8CE9"))
                                .cornerRadius(29)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                            }
                            .padding(.trailing, 24)
                            .padding(.bottom, 20)
                        }
                    },
                    alignment: .bottomTrailing
                )
            }
            .navigationBarHidden(true)
            
            if isModalPresented {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        isModalPresented = false
                    }
                
                MyListsModalView(lists: myLists, isPresented: $isModalPresented)
                    .frame(maxHeight: getListsViewHeight())
                    .transition(.move(edge: .bottom))
            }
        }
        .animation(.easeInOut, value: isModalPresented)
    }
    
    var myLists: [List] {
        return [
            List(title: "ADD TO FAVORITES", imageName: "star", itemsCount: 23),
            List(title: "MORNING TASKS", imageName: "sun", itemsCount: 10),
            List(title: "DAYLY TASKS", imageName: "pencil", itemsCount: 1)
        ]
    }
    
    private func getListsViewHeight() -> CGFloat {
        let listItemHeight: CGFloat = 66
        let listsDefaultHeight: CGFloat = 130
        
        let maxHeight = CGFloat(myLists.count) * listItemHeight + listsDefaultHeight
        return maxHeight
    }
}
