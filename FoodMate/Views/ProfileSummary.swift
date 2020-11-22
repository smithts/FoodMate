//
//  ProfileView.swift
//  FoodMate
//
//  Created by Tanner Smith on 11/14/20.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var userData: UserData
    var profile: Profile
    @State var editAllergies = false

    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()
    
    var editAllergiesButton: some View {
        Button(action: {
            self.editAllergies.toggle()
        }) {
            Text("Add/Remove Allergens")
                .bold()
                .foregroundColor(.blue)
        }
    }
    
    
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Date of Birth")) {
                    //Text(profile.birthday)
                    Text(formatter.string(from: profile.birthday))
                }
                
                Section(header: Text("Allergens")) {
                    
                    ForEach(userData.allergies, id:\.self) { allergen in
                        Text(allergen)
                    }
                    
                    HStack {
                        Spacer()
                        editAllergiesButton
                        Spacer()
                    }
                    
                    
                }
                
            }.navigationTitle(profile.name + "'s Profile")
            .padding(.top, 20)
            .sheet(isPresented: $editAllergies) {
                AllergyEditView()
            }
            
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default).environmentObject(UserData())
    }
}
