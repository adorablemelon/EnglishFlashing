//
//  EnglishFlashingApp.swift
//  EnglishFlashing
//
//  Created by bao le gia on 30/05/2022.
//

import SwiftUI
import FirebaseCore

@main
struct EnglishFlashingApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
