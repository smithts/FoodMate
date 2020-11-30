//
//  FoodMateApp.swift
//  FoodMate
//

import SwiftUI

@main
struct FoodMateApp: App {
    var body: some Scene {
        WindowGroup {
            Storage().environmentObject(UserData())
        }
    }
}

