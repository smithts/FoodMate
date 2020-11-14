//
//  FoodMateApp.swift
//  FoodMate
//
//  Created by Tanner Smith on 10/27/20.
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

