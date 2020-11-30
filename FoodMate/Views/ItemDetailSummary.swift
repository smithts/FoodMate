//
//  ItemDetail.swift
//  FoodMate
//

import SwiftUI

struct ItemDetailSummary: View {
    @Environment(\.editMode) var mode
    
    var item: FoodItem
    
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        VStack(spacing: 10) {
            if (item.color == Color.red) {
                VStack {
                    Text("Allergen Warning").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    if (!item.allergens.isEmpty) {
                        Text("This food contains: " + item.allergens[0]).font(.subheadline)
                    }
                }.foregroundColor(.red)
            }
            
            Text(item.name)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .font(.title)
                .padding()
            
            RemoteImage(url: item.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .padding()
            
            List {
                Section(header: Text("Category")) {
                    Text(item.category)
                }
                Section(header: Text("Best by Date")) {
                    Text(formatter.string(from: item.expiration))
                }
                Section(header: Text("Ingredients")) {
                    Text(item.ingredients)
                }
            }
            
            Spacer()
        }
        .foregroundColor(Color.white.opacity(0.7))
        .padding()
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailSummary(item: FoodItem(name: "Carrots", category: "Vegetable", expiration: Date(), ingredients: "No Ingredients"))
    }
}
