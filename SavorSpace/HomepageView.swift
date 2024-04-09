//
//  HomepageView.swift
//  SavorSpace
//
//  Created by user250623 on 4/8/24.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Banner for featured recipes
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Featured Recipes")
                            .font(.headline)
                            .padding([.top, .horizontal])
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<5, id: \.self) { _ in
                                    NavigationLink(destination: Text("Detail View")) {
                                        FeaturedRecipeCard()
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }

                    // Categories Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Categories")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 20) {
                            ForEach(0..<6, id: \.self) { _ in
                                NavigationLink(destination: Text("Category Detail")) {
                                    CategoryCard()
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Welcome to SavorSpace")
        }
    }
}

struct FeaturedRecipeCard: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.gray)
                .frame(width: 180, height: 120)
                .cornerRadius(10)
            Text("Recipe Title")
                .foregroundColor(.primary)
        }
        .frame(width: 180, height: 140)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct CategoryCard: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            Text("Category")
                .foregroundColor(.white)
        }
        .frame(width: 100, height: 120)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

