//
//  AllergyEditView.swift
//  FoodMate
//
//  Created by Tanner Smith on 11/21/20.
//

import SwiftUI

struct AllergyEditView: View {
    
    @EnvironmentObject var userData: UserData
    
    @State var showingAddAllergy = false
    
    var addAllergyButton: some View {
        Button(action: { self.showingAddAllergy.toggle() }) {
            Image(systemName: "plus")
                .imageScale(.large)
                .accessibility(label: Text("Add New Allergy"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.userData.allergies, id: \.self) { allergen in
                    Text(allergen)
                    
                }.onDelete(perform: onDelete)
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("User Allergies")
            .navigationBarItems(
                trailing: addAllergyButton
            )
            .sheet(isPresented: $showingAddAllergy) {
                AddAllergyView().environmentObject(self.userData)
            }
            
            
        }
    }
    
    private func onDelete(offsets: IndexSet) {
        self.userData.allergies.remove(atOffsets: offsets)
    }
}

struct AllergyEditView_Previews: PreviewProvider {
    static var previews: some View {
        AllergyEditView().environmentObject(UserData())
    }
}
