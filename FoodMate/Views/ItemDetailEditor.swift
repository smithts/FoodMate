//
//  ItemDetailEditor.swift
//  FoodMate
//
//  Created by Tanner Smith on 11/26/20.
//

import SwiftUI

struct ItemDetailEditor: View {
    @EnvironmentObject var item: FoodItem
    
    var body: some View {
        List {
            HStack {
                Text("Name        ").bold()
                Divider()
                TextField("Name", text:$item.name)
            }
            HStack {
                Text("Category  ").bold()
                Divider()
                TextField("Category", text:$item.category)
            }
            HStack {
                Text("Expiration").bold()
                Divider()
                TextField("Expiration", text:$item.expiration)
            }
        }
    }
}

struct ItemDetailEditor_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailEditor().environmentObject(FoodItem(name: "Carrots", category: "Vegetables", expiration: "N/A", ingredients: ""))
    }
}
