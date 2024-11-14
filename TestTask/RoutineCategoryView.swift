//
//  RoutineCategoryView.swift
//  TestTask
//
//  Created by Anna on 11/14/24.
//

import SwiftUI

struct RoutineCategoryView: View {
    let category: String
    let imageName: String
    
    var body: some View {
        NavigationLink(destination: DetailView(title: category)) {
            HStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(category)
                    .font(.headline)
                    .padding()
                Spacer()
            }
            .background(Color.blue.opacity(0.1))
            .cornerRadius(8)
            .padding()
        }
    }
}
