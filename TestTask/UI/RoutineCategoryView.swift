//
//  RoutineCategoryView.swift
//  TestTask
//
//  Created by Anna on 11/14/24.
//

import SwiftUI

struct RoutineCategoryView: View {
    let category: Category
    
    var body: some View {
        NavigationLink(destination: CategoryDetailView(category: category)) {
            HStack {
                Image(category.imageName)
                    .resizable()
                    .frame(width: 92, height: 92)
                Text(category.title)
                    .font(.custom("Karl-Regular", size: 14))
                    .foregroundColor(.black)
                    .padding(.horizontal, 15)

                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .background(Color("blue_0C8CE9").opacity(0.15))
            .cornerRadius(6)
            .padding(.horizontal, 20)
        }
    }
}
