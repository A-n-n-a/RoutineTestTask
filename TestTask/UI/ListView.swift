//
//  ListView.swift
//  TestTask
//
//  Created by Anna on 11/14/24.
//

import SwiftUI

struct ListView: View {
    
    var list: List
    
    var body: some View {
        HStack(spacing: 16) {
            
            Image(list.imageName)
                .resizable()
                .frame(width: 56, height: 56)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(list.title)
                    .font(.custom("Karl-Regular", size: 14))
                    .foregroundColor(.black)
                
                Text("\(list.itemsCount) items")
                    .font(.custom("OpenSans-Regular", size: 12))
                    .foregroundColor(Color("text_575767"))
            }
            
            Spacer()
            
            Image("arrow_right")
                .resizable()
                .frame(width: 12, height: 16)
        }
        .background(Color.white)
    }
}
