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
            Text(item.name).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.white)
            
            HStack {
                Text(item.expiration).font(.subheadline).foregroundColor(.white)
                Spacer()
                Text(item.category)
                    .foregroundColor(.white)
            }
            
        }.padding(.all)
        .background(Color.blue.opacity(0.7))
        
    }
}

struct FoodItemView_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemView(item: foodData[0])
    }
}
