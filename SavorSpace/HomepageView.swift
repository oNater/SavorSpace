//
//  HomepageView.swift
//  SavorSpace
//
//  Created by user250623 on 4/8/24.
//

import SwiftUI

struct HomePageView: View {
    @State private var selectedLetter: String?

    var body: some View {
        NavigationView {
            if let letter = selectedLetter {
                MealsListView(firstLetter: letter, selectedLetter: $selectedLetter)
            } else {
                LetterSelectionView(selectedLetter: $selectedLetter)
            }
        }
    }
}


