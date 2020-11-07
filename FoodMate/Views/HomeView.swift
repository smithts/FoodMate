//
//  Home.swift
//  FoodMate
//
//  Created by Tanner Smith on 10/27/20.
//

import SwiftUI

struct Storage: View {
    
    @State var showingProfile = false
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                ForEach(foodData, id: \.name) { item in
                    NavigationLink(
                        destination: ItemDetail(item: item)
                    ) {
                        FoodItemView(item: item)
                    }
                }
            }
            .navigationBarTitle("Food Storage")
            .navigationBarItems(
                leading: Text("+").bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/),
                trailing: profileButton
            )
            
        }
    }
}

struct Storage_Previews: PreviewProvider {
    static var previews: some View {
        Storage()
    }
}
