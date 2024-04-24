//
//  MainView.swift
//  SavorSpace
//
//  Created by user250623 on 4/21/24.
//

import SwiftUI

struct MainView: View {
    @State private var selectedLetter: String?  // Holds the selected letter, if any

    var body: some View {
        NavigationView {
            if let selectedLetter = selectedLetter {
                // Ensure selectedLetter is passed as a binding to MealsListView
                MealsListView(firstLetter: selectedLetter, selectedLetter: $selectedLetter)
            } else {
                // Allow user to select a letter
                LetterSelectionView(selectedLetter: $selectedLetter)
            }
        }
    }
}

