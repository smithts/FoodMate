//
//  UserData.swift
//  FoodMate
//
//  Created by Tanner Smith on 11/14/20.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var addedFood = Array<FoodItem>()
}

