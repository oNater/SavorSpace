//
//  MealDetailView.swift
//  SavorSpace
//
//  Created by user250623 on 4/21/24.
//

import SwiftUI

struct MealDetailView: View {
    let meal: Meal

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: meal.thumbnail)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .aspectRatio(contentMode: .fit)

                Text(meal.name)
                    .font(.title)

                if let instructions = meal.instructions {
                    Text("Instructions")
                    Text(instructions)
                        .padding()
                }

                // Properly handle optional ingredients
                if let ingredients = meal.ingredients {
                    Text("Ingredients")
                    ForEach(ingredients, id: \.self) { ingredient in
                        Text(ingredient)
                            .padding(.bottom, 2)
                    }
                } else {
                    Text("")
                }
            }
            .padding()
        }
        .navigationTitle(meal.name)
    }
}

