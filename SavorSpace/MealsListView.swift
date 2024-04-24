//
//  MealsListView.swift
//  SavorSpace
//
//  Created by user250623 on 4/21/24.
//
// MealsListView.swift

import SwiftUI

struct MealsListView: View {
    var firstLetter: String
    @Binding var selectedLetter: String?  // Bind to the selected letter
    @ObservedObject var viewModel = MealViewModel()

    var body: some View {
        VStack {
            List(viewModel.meals) { meal in
                NavigationLink(destination: MealDetailView(meal: meal)) {
                    MealDetailView(meal: meal)
                }
            }
            .navigationTitle("Meals Starting with \(firstLetter)")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        self.selectedLetter = nil  // Reset the selected letter
                    }
                }
            }

            Spacer()
        }
        .onAppear {
            viewModel.fetchMeals(byFirstLetter: firstLetter)
        }
    }
}
