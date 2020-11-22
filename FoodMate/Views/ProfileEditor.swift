//
//  ProfileEditor.swift
//  FoodMate
//
//  Created by Tanner Smith on 11/20/20.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            HStack {
                Text("Name").bold()
                Divider()
                TextField("Name", text:$profile.name)
            }
            
            DatePicker("Date of Birth", selection: $profile.birthday, displayedComponents: .date)
            
            
            
            
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default)).environmentObject(UserData())
    }
}
