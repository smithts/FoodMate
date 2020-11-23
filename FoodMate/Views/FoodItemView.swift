//
//  FoodItemView.swift
//  FoodMate
//
//  Created by Tanner Smith on 10/27/20.
//

import SwiftUI

struct FoodItemView: View {
    var item: FoodItem
    
    @State var expiration = Date()
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack {
                //Text(item.expiration).font(.subheadline).foregroundColor(.white)
                Spacer()
                Text(item.name).font(.title).foregroundColor(.white)
                Spacer()
                //Text(item.category)
                    //.foregroundColor(.white)
            }
            if (item.color == Color.red) {
                
                HStack {
                    Spacer()
                    Text("ALLERGEN WARNING").font(.subheadline)
                    Spacer()
                }
                
            }
            
        }.background(item.color.opacity(0.7))
        .frame(maxHeight: 400)
        
        
    }
}

struct FoodItemView_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemView(item: FoodItem(name: "Carrots", category: "Vegetable", expiration: "1/1/2021", ingredients: ""))
    }
}
