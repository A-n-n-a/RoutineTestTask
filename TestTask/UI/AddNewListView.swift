//
//  AddNewListView.swift
//  TestTask
//
//  Created by Anna on 11/14/24.
//

import SwiftUI

struct AddNewListView: View {
    
    var body: some View {
        HStack(spacing: 16) {
            
            Image("add_list")
                .resizable()
                .frame(width: 56, height: 56)
                .cornerRadius(8)
            
            Text("ADD TO NEW LIST")
                    .font(.custom("Karl-Regular", size: 14))
                    .foregroundColor(Color("blue_0C8CE9"))
            
            Spacer()
        }
        .background(Color.white)
    }
}
