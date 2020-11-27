//
//  FoodItem.swift
//  FoodMate
//
//  Created by Tanner Smith on 11/5/20.
//

import SwiftUI

final class FoodItem: ObservableObject {//, /*Codable*/ {
    @Published var name: String
    @Published var category: String
    @Published var expiration: String
    @Published var ingredients: String
    
    //Default Color Value
    @Published var color = Color.blue
    @Published var allergens = [String]()
    @Published var imageURL = "https://news.nutritioneducationstore.com/wp-content/uploads/2012/10/thanksgiving_1.jpg"
    
    init(name: String, category: String, expiration: String, ingredients: String) {
        self.name = name
        self.category = category
        self.expiration = expiration
        self.ingredients = ingredients
    }
}

