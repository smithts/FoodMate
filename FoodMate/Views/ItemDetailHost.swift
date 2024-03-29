//
//  ItemDetailHost.swift
//  FoodMate
//

import SwiftUI

struct ItemDetailHost: View {
    @Environment(\.editMode) var mode
    
    @EnvironmentObject var item: FoodItem
    
    var body: some View {
        VStack{
            HStack {
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") {
                        self.mode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                
                EditButton()
            }
            if self.mode?.wrappedValue == .inactive {
                ItemDetailSummary(item: self.item)
            } else {
                ItemDetailEditor().environmentObject(self.item)
            }
        }
        .padding()
    }
}

struct ItemDetailHost_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailHost().environmentObject(FoodItem(name: "Carrots", category: "Vegetables", expiration: Date(), ingredients: ""))
    }
}
