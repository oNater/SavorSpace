//
//  LoginView.swift
//  SavorSpace
//
//  Created by user250623 on 4/8/24.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @Binding var isShowingLoginView: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String?
    @State private var shouldNavigateToHome = false  

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Welcome to SavorSpace")
                    .font(.largeTitle)
                    .padding()

                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.horizontal, .bottom])

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.horizontal, .bottom])

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }

                Button("Log In") {
                    self.loginUser(email: self.email, password: self.password)
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)

                Button("Need an account? Sign Up") {
                    self.isShowingLoginView = false
                }
                .foregroundColor(.secondary)
            }
            .padding()
            .navigationDestination(isPresented: $shouldNavigateToHome) {
                HomePageView()
            }
        }
    }

    private func loginUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = "Login failed: \(error.localizedDescription)"
            } else {
                self.shouldNavigateToHome = true
            }
        }
    }
}

