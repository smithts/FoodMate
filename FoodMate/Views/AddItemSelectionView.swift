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
    
    @Environment(\.presentationMode) var presentationMode
    
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
        let item = FoodItem(name: foodName, category: category, expiration: expiration)
        
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
                
                userData.addedFood.append(FoodItem(name: code, category: "TestScan", expiration: "TestScan"))
         
            case .failure(let error):
                print(error)
        }
        
        //returns to Storage View
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct AddItemSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemSelectionView()
    }
}
