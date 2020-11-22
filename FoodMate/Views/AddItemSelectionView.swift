//
//  AddItemSelectionView.swift
//  FoodMate
//
//  Created by Tanner Smith on 11/14/20.
//

import SwiftUI
import CodeScanner
import SwiftyJSON

struct AddItemSelectionView: View {
    @EnvironmentObject var userData: UserData
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showingScanner = false
    
    @State var foodName = ""
    @State var category = ""
    @State var expiration = ""
    
    
    //Test
    
    let sample = """
    {
        "products": [
            {
                "barcode_number": "077975080092",
                "barcode_type": "UPC",
                "barcode_formats": "UPC 077975080092, EAN 0077975080092",
                "mpn": "12935862",
                "product_name": "Snyder's Pretzel Sticks, 16 Ounce Bag",
                "expiration": "Expiration",
                "category": "Food, Beverages & Tobacco > Food Items > Snack Foods > Pretzels",
                "manufacturer": "Snyder's Of Hanover",
                "brand": "Snyder's-Lance, Inc.",
                "ingredients": "Enriched Flour (wheat Flour, Niacin, Reduced Iron, Thiamine Mononitrate, Riboflavin, Folic Acid), Water, Malt (tapioca Syrup, Malt Extract), Salt, Canola Oil, Yeast, Soda.",
                "nutrition_facts": "Protein 10 G, Total lipid (fat) 3.33 G, Carbohydrate, by difference 76.67 G, Energy 367 KCAL, Sugars, total including NLEA 3.33 G, Fiber, total dietary 3.3 G, Calcium, Ca 0 MG, Iron, Fe 3.6 MG, Sodium, Na 1000 MG, Vitamin A, IU 0 IU, Vitamin C, total ascorbic acid 0 MG, Thiamin 0 MG, Riboflavin 0.34 MG, Niacin 5.333 MG, Folate, total 200 UG, Cholesterol 0 MG, Fatty acids, total trans 0 G, Fatty acids, total saturated 0 G, Fatty acids, total monounsaturated 0 G, Fatty acids, total polyunsaturated 0 G",
                "description": "Our classic Pretzel Sticks in a form that the whole family can enjoy! What do you do with your Pretzel Sticks? You can dip them, stack them, but whatever you do, enjoy them! We bake to the highest quality following our nearly 100 year old recipes. Our Pretzel Sticks offer a classic taste and a shape that is sure to be a perfect accompaniment to your favorite mustard or cheese dip. Plus, since they're made in a facility that does not process peanuts, they're great for kids.",
                "images": [
                    "https://images.barcodelookup.com/3181/31817127-1.jpg"
                ]
            }
        ]
    }
    """
    
    //Test
    
    
    let apiKey = "s6ci51zyxl0bzcpdvit8bp376b1i41"
    
    var scanButton: some View {
        Button(action: { self.showingScanner = true }) {
            Text("Scan Barcode").font(.headline)
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $foodName)
                    TextField("Category", text: $category)
                    TextField("Expiration", text: $expiration)
                    
                }
                
                Button(action: {
                    addItemToStorage()
                }) {
                    Text("Submit").font(.headline)
                }
            }
            .navigationBarTitle("Add Food Item")
            .navigationBarItems(trailing: scanButton)
            
            
        }
        .sheet(isPresented: $showingScanner) {
            CodeScannerView(codeTypes: [.ean13,.ean8,.upce], simulatedData: "FakeScan", completion: self.handleScan)
        }
    }
    
    func addItemToStorage() {
        let item = FoodItem(name: foodName, category: category, expiration: expiration, ingredients: "", imageURL: "")
        
        //Add new food item to the list
        userData.addedFood.append(item)
        
        //returns to Storage View
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
        //Exits scan view
        self.showingScanner = false
        
        switch result {
            case .success(let code):
                //This solution works, but is commented out to save API calls to the service.
                /*
                guard let url = URL(string: "https://api.barcodelookup.com/v2/products?barcode=" + code + "&formatted=y&key=" + apiKey) else {
                    print("Invalid URL")
                    return
                }
                
                let task = URLSession.shared.dataTask(with: url) {data, response, error in
                    guard let data = data else {
                        fatalError("Error: missing response data")
                    }
                    do {
                        if let json = try? JSON(data: sample) {
                            let product = json["products"].arrayValue
                            let item = product[0]
                            
                            userData.addedFood.append(FoodItem(name: item["product_name"].stringValue, category: "Test", expiration: "Test", ingredients: item["ingredients"].stringValue))
                            
                            
                        }
                    }
                    catch {
                        print("Error: \(error.localizedDescription)")
                    }
                }
                task.resume()
                */
                
                
                // This solution uses the hardcoded JSON string above to save API calls
                if let data = sample.data(using: .utf8) {
                    if let json = try? JSON(data: data) {
                        for item in json["products"].arrayValue {
                            var food = FoodItem(
                                                name: item["product_name"].stringValue,
                                                category: item["category"].stringValue,
                                                expiration: "",
                                                ingredients: item["ingredients"].stringValue,
                                                imageURL: item["images"][0].stringValue)
                            if (containsAllergens(foodItem: food)) {
                                //This food item has something that the user is allergic to
                            } else {
                                userData.addedFood.append(food)
                            }
                        }
                    }
                }
 
                
                
                
         
            case .failure(let error):
                print(error)
        }
        
        //returns to Storage View
        self.presentationMode.wrappedValue.dismiss()
    }
    
    //returns true if allergen is found
    func containsAllergens(foodItem: FoodItem) -> Bool {
        var ingredients = foodItem.ingredients
        var contains = false
        
        userData.allergies.forEach { allergen in
            
            if let range = ingredients.range(of: allergen, options: .caseInsensitive) {
                contains = true
            }
        }
        return contains
    }
}

struct AddItemSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemSelectionView()
    }
}
