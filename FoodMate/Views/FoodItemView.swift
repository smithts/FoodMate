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
        //VStack(alignment: .leading){
            
            HStack {
                //Text(item.expiration).font(.subheadline).foregroundColor(.white)
                Spacer()
                Text(item.name).font(.title).foregroundColor(.white)
                Spacer()
                //Text(item.category)
                    //.foregroundColor(.white)
            }.background(Color.blue.opacity(0.7))
            .frame(maxHeight: 400)
            
            
        //}.padding(.all)
        //.background(Color.blue.opacity(0.7))
        
    }
}

struct FoodItemView_Previews: PreviewProvider {
    static var previews: some View {
        FoodItemView(item: foodData[0])
    }
}
