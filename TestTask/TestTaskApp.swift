//
//  TestTaskApp.swift
//  TestTask
//
//  Created by Anna on 11/14/24.
//

import SwiftUI

@main
struct TestTaskApp: App {
    
    init() {
        registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
