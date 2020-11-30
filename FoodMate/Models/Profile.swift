//
//  Profile.swift
//  FoodMate
//
//  Created by Tanner Smith on 11/21/20.
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
