//
//  FoodItemView.swift
//  FoodMate
//
//  Created by Tanner Smith on 10/27/20.
//

import SwiftUI

struct FoodItemView: View {
    var item: FoodItem
    
    @State var expiration = Date()
    
    var body: some View {
        VStack(alignment: .leading){
            Text(item.name).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            HStack {
                Text(item.expiration).font(.subheadline)
                Spacer()
                Text(item.category)
            }
            
        }.padding(.all)
    }
}

struct FoodItemView_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemView(item: foodData[0])
    }
}
