//
//  AddItemSelectionView.swift
//  FoodMate
//
//  Created by Tanner Smith on 11/14/20.
//

import SwiftUI
import CodeScanner

struct AddItemSelectionView: View {
    @EnvironmentObject var userData: UserData
    
    @State private var showingScanner = false
    
    @State var foodName = ""
    @State var category = ""
    @State var expiration = ""
    
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
                    Button(action: {
                        addItemToList()
                    }) {
                        Text("Submit")
                    }
                }
                
            }
            .navigationBarTitle("Add Food Item")
            .navigationBarItems(trailing: scanButton)
        }.sheet(isPresented: $showingScanner) {
            CodeScannerView(codeTypes: [.ean13,.ean8,.upce], simulatedData: "Chicken-Meat-1/1/2021", completion: self.handleScan)
        }
    }
    
    func addItemToList() {
        let item = FoodItem(name: foodName, category: category, expiration: expiration)
        
        userData.addedFood.append(item)
        
        //need something here to return to the storage view
        
    }
    
    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
        self.showingScanner = false
        
        switch result {
            case .success(let code):
                
                userData.addedFood.append(FoodItem(name: code, category: "TestScan", expiration: "TestScan"))
         
            case .failure(let error):
                userData.addedFood.append(FoodItem(name: "Scan", category: "Scan", expiration: "Scan"))
        }
 
    }
}

struct AddItemSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemSelectionView()
    }
}
