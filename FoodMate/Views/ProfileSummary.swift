//
//  ProfileView.swift
//  FoodMate
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var userData: UserData
    
    @State var editAllergies = false
    
    var profile: Profile

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
                    Text(formatter.string(from: profile.birthday))
                }
                
                Section(header: Text("Allergens")) {
                    ForEach(self.userData.allergies, id:\.self) { allergen in
                        Text(allergen)
                    }
                    
                    HStack {
                        Spacer()
                        editAllergiesButton
                        Spacer()
                    }
                }
            }
            .navigationTitle(profile.name + "'s Profile")
            .padding(.top, 20)
            .sheet(isPresented: $editAllergies) {
                AllergyEditView().environmentObject(self.userData)
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default).environmentObject(UserData())
    }
}
