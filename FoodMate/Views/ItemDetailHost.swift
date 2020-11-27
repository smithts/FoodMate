//
//  ItemDetailHost.swift
//  FoodMate
//
//  Created by Tanner Smith on 11/26/20.
//

import SwiftUI

struct ItemDetailHost: View {
    @Environment(\.editMode) var mode
    
    @EnvironmentObject var item: FoodItem
    
    
    var body: some View {
        //NavigationView {
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
                    ItemDetail(item: self.item)
                    //ProfileSummary(profile: self.userData.profile)
                } else {
                    ItemDetailEditor().environmentObject(self.item)
                        
                }
            }//.navigationBarItems(trailing: EditButton())
        //}
        .padding()
    }
}

struct ItemDetailHost_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailHost().environmentObject(FoodItem(name: "Carrots", category: "Vegetables", expiration: "N/A", ingredients: ""))
    }
}
