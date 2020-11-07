//
//  ItemDetail.swift
//  FoodMate
//
//  Created by Tanner Smith on 11/5/20.
//

import SwiftUI

struct ItemDetail: View {
    var item: FoodItem
    
    var body: some View {
        Text(item.name)
            .font(.largeTitle)
            .foregroundColor(.red)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: foodData[0])
    }
}
