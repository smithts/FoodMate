//
//  UserData.swift
//  FoodMate
//
//  Created by Tanner Smith on 11/14/20.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var profile = Profile.default
    @Published var addedFood = Array<FoodItem>()
    @Published var allergies = Array<String>()
}

