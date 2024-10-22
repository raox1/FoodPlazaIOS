//
//  ContentView.swift
//  FoodPlaza
//
//  Created by Lalit Kumar on 22/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    FoodSection(
                        sectionTitle: "Starter Items",
                        foodName: "Samosa",
                        price: "$8",
                        imageName: "samosa"
                    )
                    
                    FoodSection(
                        sectionTitle: "Breakfast",
                        foodName: "Pasta",
                        price: "$8",
                        imageName: "pasta"
                    )
                }
                .padding()
            }
            .background(Color.black) // Black background
            .navigationTitle("FOOD PLAZA")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Handle search action
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct FoodSection: View {
    let sectionTitle: String
    let foodName: String
    let price: String
    let imageName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(sectionTitle)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .shadow(radius: 8)
                
                VStack {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                    Text(foodName)
                        .font(.headline)
                        .padding(.top, 8)
                    
                    Text("Price: \(price)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    HStack {
                        CircularIconButton(systemName: "arrow.backward") {
                            // Handle back action
                        }
                        
                        Spacer()
                        
                        CircularIconButton(systemName: "arrow.forward") {
                            // Handle forward action
                        }
                    }
                    .padding(.top, 12)
                    .padding(.horizontal, 24)
                }
                .padding()
            }
        }
        .padding(.horizontal)
    }
}

struct CircularIconButton: View {
    let systemName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .foregroundColor(.white)
                .frame(width: 48, height: 48)
                .background(Color.black)
                .clipShape(Circle())
        }
    }
}

#Preview {
    ContentView()
}
