//
//  CustomTabBar.swift
//  TestTask
//
//  Created by Anna on 11/14/24.
//

import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "house")
            Spacer()
            Image(systemName: "list.bullet")
            Spacer()
            Image(systemName: "person")
            Spacer()
        }
        .padding()
        .background(Color.blue.opacity(0.2))
        .cornerRadius(16)
    }
}
