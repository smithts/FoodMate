//
//  FoodItem.swift
//  FoodMate
//

import SwiftUI

final class FoodItem: ObservableObject {
    @Published var name: String
    @Published var category: String
    @Published var expiration: Date
    @Published var ingredients: String
    @Published var allergens: [String]
    
    //Default Values
    @Published var color = Color.blue
    @Published var imageURL = "https://news.nutritioneducationstore.com/wp-content/uploads/2012/10/thanksgiving_1.jpg"
    
    init(name: String, category: String, expiration: Date, ingredients: String) {
        self.name = name
        self.category = category
        self.expiration = expiration
        self.ingredients = ingredients
        self.allergens = [String]()
    }
}
