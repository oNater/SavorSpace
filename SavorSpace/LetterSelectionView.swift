//
//  LetterSelectionView.swift
//  SavorSpace
//
//  Created by user250623 on 4/21/24.
//

import SwiftUI

struct LetterSelectionView: View {
    @Binding var selectedLetter: String?

    let letters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    
    var body: some View {
        VStack {
            // Title at the top of the view
            Text("Select a letter to show recipes:")
                .font(.title)
                .padding(.top, 20)  // Top padding to give some space from the top of the screen

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10) {  // Increased spacing to add padding between letters
                    ForEach(letters, id: \.self) { letter in
                        Button(action: {
                            self.selectedLetter = String(letter)
                        }) {
                            Text(String(letter))
                                .font(.largeTitle)  // Large font for better readability
                                .frame(minHeight: 0, maxHeight: .infinity)
                                .frame(width: UIScreen.main.bounds.width)
                                .padding(.vertical, 10)  // Padding inside the button for better tap area
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }
                    }
                }
                .frame(maxHeight: .infinity)
            }
            .padding(.horizontal)  // Padding on both sides of the ScrollView
        }
    }
}
