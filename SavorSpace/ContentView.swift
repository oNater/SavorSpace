//
//  ContentView.swift
//  SavorSpace
//
//  Created by user250623 on 4/8/24.
//
import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var isShowingLoginView = true
    @State private var isAuthenticated = false

    var body: some View {
        NavigationView {
            if isAuthenticated {
                HomePageView()
            } else {
                VStack {
                    if isShowingLoginView {
                        LoginView(isShowingLoginView: $isShowingLoginView, isAuthenticated: $isAuthenticated)
                    } else {
                        SignUpView(isShowingLoginView: $isShowingLoginView, isAuthenticated: $isAuthenticated)
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
        .onAppear {
            self.isAuthenticated = Auth.auth().currentUser != nil
        }
    }
}



#Preview {
    ContentView()
}
