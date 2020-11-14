//
//  AddItemSelectionView.swift
//  FoodMate
//
//  Created by Tanner Smith on 11/14/20.
//

import SwiftUI

struct AddItemSelectionView: View {
    @EnvironmentObject var userData: UserData
    
    @State var foodName = ""
    @State var category = ""
    @State var expiration = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $foodName)
                    TextField("Category", text: $category)
                    TextField("Expiration", text: $expiration)
                    Button(action: {
                        addItemToList()
                    }) {
                        Text("Submit")
                    }
                }
                
            }
            .navigationBarTitle("Add Food Item")
            .navigationBarItems(trailing: Text("Scan Barcode"))
        }
        
        Text(foodName)
        Text(category)
        Text(expiration)
    }
    
    func addItemToList() {
        let item = FoodItem(name: foodName, category: category, expiration: expiration)
        
        userData.addedFood.append(item)
        
    }
}

struct AddItemSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemSelectionView()
    }
}
