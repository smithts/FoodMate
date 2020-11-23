//
//  ItemDetail.swift
//  FoodMate
//
//  Created by Tanner Smith on 11/5/20.
//
import SwiftUI

struct ItemDetail: View {
    
    //let jsonURL = "https://images.barcodelookup.com/3181/31817127-1.jpg"

    var item: FoodItem
    
    var body: some View {
        
        //Text(item.name)
            //.font(.largeTitle)
            //.foregroundColor(.red)
        //RemoteImage(url: jsonURL)
            //.aspectRatio(contentMode: .fit)
            //.frame(width: 200)
        
        VStack(spacing: 10) {
            Text(item.name)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .font(.title)
                .padding()
            
            RemoteImage(url: item.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .padding()
            
            //Spacer()
            HStack(alignment: .lastTextBaseline){
                Text("Category")
                Text(verbatim: item.category)
            }
            HStack(alignment: .lastTextBaseline){
                Text("Expiration")
                Text(verbatim: item.expiration)
            }
            HStack(alignment: .lastTextBaseline){
                Text("Ingredients")
                Text(item.ingredients)
            }
        }
        .foregroundColor(Color.black.opacity(0.7))
        .padding()
        
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: FoodItem(name: "Carrots", category: "Vegetable", expiration: "1/1/2021", ingredients: "No Ingredients", imageURL: "https://news.nutritioneducationstore.com/wp-content/uploads/2012/10/thanksgiving_1.jpg"))
    }
}
