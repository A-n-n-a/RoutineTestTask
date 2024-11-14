//
//  CustomNavBar.swift
//  TestTask
//
//  Created by Anna on 11/14/24.
//

import SwiftUI

struct CustomNavBar: View {
    let title: String
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack {
                Text(title)
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
                .padding(.trailing, 20)
                .padding(.bottom, 20)
        }
    }
}
