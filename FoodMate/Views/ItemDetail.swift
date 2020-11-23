//
//  ItemDetail.swift
//  FoodMate
//
//  Created by Tanner Smith on 11/5/20.
//
import SwiftUI

struct ItemDetail: View {
    
    let jsonURL = "https://images.barcodelookup.com/3181/31817127-1.jpg"

    var item: FoodItem
    var body: some View {
        RemoteImage(url: jsonURL)
            .aspectRatio(contentMode: .fit)
            .frame(width: 200)
        Text(item.name)
                    .font(.largeTitle)
                    .foregroundColor(.red)
        Text(item.imageURL)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: FoodItem(name: "Carrots", category: "Vegetable", expiration: "1/1/2021", ingredients: "No Ingredients"))
    }
}
