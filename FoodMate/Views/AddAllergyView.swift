//
//  AddAllergyView.swift
//  FoodMate
//
//  Created by Tanner Smith on 11/26/20.
//

import SwiftUI

struct AddAllergyView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userData: UserData
    
    @State var allergyName = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Allergy", text: $allergyName)
                }
                
                Button(action: {
                    addAllergy()
                }) {
                    Text("Submit").font(.headline)
                }
            }
            .navigationBarTitle("Add Allergy")
        }
    }
    
    func addAllergy() {
        self.userData.allergies.append(allergyName)
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct AddAllergyView_Previews: PreviewProvider {
    static var previews: some View {
        AddAllergyView().environmentObject(UserData())
    }
}
