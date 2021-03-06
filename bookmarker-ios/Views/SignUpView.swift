//
//  SignUpView.swift
//  bookmarker-ios
//
//  Created by Kenneth Ng on 9/11/20.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @StateObject var vm = SignUpViewModel()
    
    func signUp() {
        self.vm.signUpAnonymousUserWithEmailAndPassword { (error) in
            if let error = error {
                print("Error signing up: \(error.localizedDescription)")
                return 
            }
            
            //  Refresh the appState's reference of the authUser
            guard let authUser = Auth.auth().currentUser else { return }
            self.appState.authUser = authUser
            
            NotificationCenter.default.post(name: .didCompleteAuthentication, object: nil)
        }
    }
    
    var body: some View {
        VStack {
            TextField("Email", text: self.$vm.email)
                .keyboardType(.emailAddress)
            SecureField("Password", text: self.$vm.password)
            Button(action: signUp) {
                Text("Sign up")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: Constants.cornerRadius).fill(Color.primary))
            }
            .disabled(self.vm.isLoading)
            Button(action: {
                self.authViewModel.isSigningUp.toggle()
            }) {
                Text("Log in")
            }
            .disabled(self.vm.isLoading)
        }
        .padding()
        .navigationTitle("Sign up")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
