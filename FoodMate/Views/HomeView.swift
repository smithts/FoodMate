//
//  Home.swift
//  FoodMate
//

import SwiftUI

struct Storage: View {
    
    @State var showingProfile = false
    @State var showingAddItem = false
    
    @State var header = "Food Storage"
    
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
            List {
                ForEach(self.userData.addedFood, id: \.name) { item in
                    NavigationLink(
                        destination: ItemDetailHost().environmentObject(item)
                    ) {
                        FoodItemView().environmentObject(item)
                    }
                    
                }.onDelete(perform: onDelete)
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle(header)
            .navigationBarItems(
                leading: addItemButton,
                trailing: profileButton
            )
            .sheet(isPresented: $showingAddItem) {
                AddItemSelectionView().environmentObject(self.userData)
            }
            .background(EmptyView().sheet(isPresented: $showingProfile) {
                ProfileHost().environmentObject(self.userData)
            } )
        }
    }
    
    private func onDelete(offsets: IndexSet) {
        self.userData.addedFood.remove(atOffsets: offsets)
    }
}

struct Storage_Previews: PreviewProvider {
    static var previews: some View {
        Storage().environmentObject(UserData())
    }
}
