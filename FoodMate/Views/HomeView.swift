//
//  Home.swift
//  FoodMate
//
//  Created by Tanner Smith on 10/27/20.
//

import SwiftUI

struct Storage: View {
    
    @State var showingProfile = false
    @State var showingAddItem = false
    
    @EnvironmentObject var userData: UserData
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    
    var addItemButton: some View {
        Button(action: { self.showingAddItem.toggle() }) {
            Image(systemName: "plus")
                .imageScale(.large)
                .accessibility(label: Text("Add New Item"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                ForEach(userData.addedFood, id: \.name) { item in
                    NavigationLink(
                        destination: ItemDetail(item: item)
                    ) {
                        FoodItemView(item: item)
                    }
                }
            }
            .navigationBarTitle("Food Storage")
            .navigationBarItems(
                leading: addItemButton,
                trailing: profileButton
            )
            .sheet(isPresented: $showingAddItem) {
                AddItemSelectionView().environmentObject(self.userData)
            }
            .background(EmptyView().sheet(isPresented: $showingProfile) {
                ProfileView()
            } )
            
            
        }
    }
}

struct Storage_Previews: PreviewProvider {
    static var previews: some View {
        Storage().environmentObject(UserData())
    }
}
