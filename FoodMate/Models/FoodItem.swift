//
//  FoodItem.swift
//  FoodMate
//
//  Created by Tanner Smith on 11/5/20.
//

import SwiftUI

struct FoodItem: Hashable {//, /*Codable*/ {
    var name: String
    var category: String
    var expiration: String
    var ingredients: String
    
    //Default Color Value
    var color = Color.blue
    var allergens = [String]()
    var imageURL = "https://news.nutritioneducationstore.com/wp-content/uploads/2012/10/thanksgiving_1.jpg"
}

