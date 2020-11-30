//
//  FoodItemView.swift
//  FoodMate
//

import SwiftUI

struct FoodItemView: View {
    @EnvironmentObject var item: FoodItem
    
    @State var expiration = Date()
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack {
                Spacer()
                Text(item.name).font(.title).foregroundColor(.white)
                Spacer()
            }
            if (item.color == Color.red) {
                HStack {
                    Spacer()
                    Text("ALLERGEN WARNING").font(.subheadline)
                    Spacer()
                }
            }
        }
        .background(item.color.opacity(0.7))
        .frame(maxHeight: 400)
    }
}

struct FoodItemView_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemView().environmentObject(FoodItem(name: "Carrots", category: "Vegetable", expiration: Date(), ingredients: ""))
    }
}
