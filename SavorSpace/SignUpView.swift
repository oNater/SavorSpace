//
//  SignUpView.swift
//  SavorSpace
//
//  Created by user250623 on 4/8/24.
//
import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @Binding var isShowingLoginView: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String?
    @State private var navigationTrigger: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Sign Up")
                    .font(.largeTitle)
                    .padding()

                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }

                Button("Create Account") {
                    signUpUser(email: email, password: password)
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(10)

                Button("Already have an account? Log In") {
                    isShowingLoginView = true
                }
                .foregroundColor(.secondary)

                .navigationDestination(isPresented: $navigationTrigger) {
                    HomePageView()
                }
            }
            .padding()
        }
    }

    private func signUpUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errorMessage = "Sign up failed: \(error.localizedDescription)"
            } else {
                // On successful signup, trigger navigation
                self.navigationTrigger = true
            }
        }
    }
}



