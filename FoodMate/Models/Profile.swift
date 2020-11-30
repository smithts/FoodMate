//
//  Profile.swift
//  FoodMate
//

import SwiftUI

struct Profile {
    var name: String
    var birthday: Date

    static let `default` = Self(name: "No One")
    
    init(name: String) {
        self.name = name
        self.birthday = Date()
    }
}
