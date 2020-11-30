//
//  ItemDetailEditor.swift
//  FoodMate
//

import SwiftUI

struct ItemDetailEditor: View {
    @EnvironmentObject var item: FoodItem
    
    var body: some View {
        List {
            HStack {
                Text("Name              ").bold()
                Divider()
                TextField("Name", text:$item.name)
            }
            HStack {
                Text("Category       ").bold()
                Divider()
                TextField("Category", text:$item.category)
            }
            HStack {
                Text("Best By Date").bold()
                Divider()
                DatePicker("", selection: $item.expiration, displayedComponents: .date)
                    .offset(x: -50)
            }
        }
    }
}

struct ItemDetailEditor_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailEditor().environmentObject(FoodItem(name: "Carrots", category: "Vegetables", expiration: Date(), ingredients: ""))
    }
}
