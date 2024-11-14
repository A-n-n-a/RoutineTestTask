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
                    .frame(width: 92, height: 92)
                Text(category)
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

#Preview {
    RoutineCategoryView(category: "DETAILED MORNING ROUTINE TASKS", imageName: "morning")
}
