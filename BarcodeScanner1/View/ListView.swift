//
//  ListView.swift
//  BarcodeScanner1
//
//  Created by Francesca Ferrini on 20/02/24.
//

import SwiftUI
import AVFoundation


//
//  ListView.swift
//  BarcodeScanner1
//
//  Created by Francesca Ferrini on 20/02/24.
//

import SwiftUI


struct ListView: View {
    
    @ObservedObject var savedProduct: SavedFoodViewModel
    @State private var isAnotherViewActive = false // Aggiungiamo uno stato per gestire la navigazione alla nuova vista
    @State var productResponse: ProductResponse?
    
    var body: some View {
        
        
        NavigationView {
            ZStack{
                Color.color2.edgesIgnoringSafeArea(.all)
                
                ForEach(savedProduct.savedFoods, id: \.self) { food in
                    VStack(alignment: .leading) {
                        
                        NavigationLink {
                            ProductDetailView(savedProduct: savedProduct, food: food)
                        } label: {
                            
                            
                            
                            HStack {
                                
                                AsyncImage(url: food.imageUrl ?? URL(string: "placeholder")!) {
                                    
                                    ProgressView()
                                }
                                .frame(width: 200, height: 200)
                                .padding()
                                Text(food.productName ?? "Name not found")
                                    .padding()
                                
                                
                            }
                            
                            
                        }
                        .foregroundStyle(.primary)
                        .padding()
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .foregroundColor(Color.white)
                                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .strokeBorder(Color.gray.opacity(0.1), lineWidth: 2)
                                    .padding(.top, -2)
                            })
                        VStack{
                            Text(food.productName ?? "Name not found")
                                .bold()
                                .padding()
                        }
                    }
                }
                if savedProduct.savedFoods.isEmpty {
                    // Mostra un'immagine quando la lista è vuota
                    
                    
                    Image("scan")
                        .padding(.top,-100)
                }
            }
            .navigationBarItems(
                leading:
                    Button(action: {
                        self.isAnotherViewActive = true // Impostiamo lo stato per attivare la navigazione alla nuova vista
                    }) {
                        Image(systemName: "gearshape").foregroundColor(.green)
                    },
                trailing:
                    NavigationLink(destination: BarcodeScannerView(productResponse: $productResponse, savedProduct: savedProduct)) {
                        Image(systemName: "barcode.viewfinder").foregroundColor(.green)
                    }
            )
            .background(
                NavigationLink(destination: SettingsView(notificationTime: Date()), isActive: $isAnotherViewActive) { // Utilizziamo un'altra NavigationLink per navigare alla nuova vista
                    EmptyView()
                }
            )
            
           
        }
        
        
    }
}

