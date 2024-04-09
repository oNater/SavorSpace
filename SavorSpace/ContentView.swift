//
//  ContentView.swift
//  SavorSpace
//
//  Created by user250623 on 4/8/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingLoginView = true

    var body: some View {
        NavigationView {
            VStack {
                if isShowingLoginView {
                    LoginView(isShowingLoginView: $isShowingLoginView)
                } else {
                    SignUpView(isShowingLoginView: $isShowingLoginView)
                }
                Spacer()
                Button(action: {
                    self.isShowingLoginView.toggle()
                }) {
                    Text(isShowingLoginView ? "Don't have an account? Sign Up" : "Already have an account? Log In")
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                }
                .padding()
            }
        }
    }
}


#Preview {
    ContentView()
}
