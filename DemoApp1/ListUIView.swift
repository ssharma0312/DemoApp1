//
//  ListUIView.swift
//  DemoApp1
//
//  Created by Sahil Sharma on 2024-03-09.
//

import SwiftUI

struct AccountCardUIView: View {
    var item: (String, String, String, String)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(item.0)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(item.1)
                        .font(.headline)
                    Text(item.2)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                }
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(item.3)
                        .font(.headline)
                    Text("per month")
                        .font(.caption)
                }
                
                
            }.padding(.horizontal, 15)
            
            
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal, 20) // Add padding from leading and trailing edges
    }
    
}

struct ListUIView: View {
    let items: [(String, String, String, String)] = [
        ("image1", "123 Main St", "A beautiful house with a spacious garden.", "$1,450"),
        ("image2", "456 Elm St", "Cozy apartment with a great view.", "$1,250"),
        ("image3", "789 Oak St", "Modern loft in the heart of the city.", "$990"),
        ("image1", "854 Osler St", "Cozy house with a great garden.", "$1,950"),
    ]
    @State private var showingAddScreen = false
        
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(hex: "5cb270").opacity(0.9), Color(hex: "f4f269").opacity(0.9)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(items, id: \.0) { item in
                            AccountCardUIView(item: item)
                        }
                    }
                }
            }
            .navigationTitle("Rental Properties")      
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        showingAddScreen.toggle()
                    }
                }
            }
            
            .sheet(isPresented: $showingAddScreen) {
                AddPropertyUIView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListUIView()
    }
}
