//
//  CustomNavBar.swift
//  TestTask
//
//  Created by Anna on 11/14/24.
//

import SwiftUI

struct CustomNavBar: View {
    let title: String
    var onBackButtonAction: (() -> Void)
    var onSelectAllAction: (() -> Void)
    @State private var isButtonSelected = false
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack(spacing: 12) {
                Button(action: {
                    onBackButtonAction()
                }) {
                    Image("arrow_left")
                        .resizable()
                        .frame(width: 9, height: 16)
                }
                .padding(.leading, 18)
                
                Text(title)
                    .font(.custom("Karl-Regular", size: 14))
                    .foregroundColor(Color("text_0C0F39"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                
                Button(action: {
                    isButtonSelected.toggle()
                    onSelectAllAction()
                }) {
                    Text(isButtonSelected ? "Cancel" : "Select All")
                        .font(.custom("OpenSans-SemiBold", size: 14))
                        .foregroundColor(isButtonSelected ? Color("text_575767") : Color("white_FFFFFF"))
                        .frame(height: 30)
                        .padding(.horizontal, 15)
                        .background(isButtonSelected ? Color("background_C5C6CC").opacity(0.4) : Color("blue_0C8CE9"))
                        .cornerRadius(15)
                }
                .padding(.trailing, 20)
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
