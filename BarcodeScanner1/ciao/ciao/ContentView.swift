//
//  ContentView.swift
//  ciao
//
//  Created by Fernando Sensenhauser on 29/02/24.
//

import SwiftUI
import SwiftData



struct ListView: View {
    
        @ObservedObject var savedProduct: SavedFoodViewModel
        var body: some View {
            NavigationStack {
                ScrollView {
                    ForEach(savedProduct.savedFoods, id: \.self) { food in
                        VStack {

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
                           
                           
                            
                            
                            
                        }
                        
                    }
                }
                
                
            }
    }
}
