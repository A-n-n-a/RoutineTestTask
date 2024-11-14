//
//  MyListsModalView.swift
//  TestTask
//
//  Created by Anna on 11/14/24.
//

import SwiftUI

struct MyListsModalView: View {
    let lists: [List]
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("MY LISTS")
                    .font(.custom("Karl-Regular", size: 14))
                    .foregroundColor(Color("text_0C0F39"))
                
                Spacer()
                
                Button(action: {
                    isPresented = false 
                }) {
                    Image("close")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .opacity(0.5)
                }
                .frame(width: 30, height: 30)
                .foregroundColor(Color("text_0C0F39"))
                .background(Color("background_7F7F7F").opacity(0.2))
                .cornerRadius(16)
            }
            .padding(.horizontal, 18)
            .padding(.top, 40)
            
            VStack(spacing: 11) {
                AddNewListView()
                    .padding(.horizontal, 18)
                ForEach(lists, id: \.title) { list in
                    ListView(list: list)
                        .frame(maxWidth: .infinity)
                        .background(Color("white_FFFFFF"))
                        .padding(.horizontal, 18)
                        .onTapGesture {
                            isPresented = false
                        }
                }
            }
            .padding(.bottom, 20)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color("white_FFFFFF"))
        .cornerRadius(20)
        .edgesIgnoringSafeArea(.bottom) 
    }
}
