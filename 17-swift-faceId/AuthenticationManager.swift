//
//  AuthenticationManager.swift
//  17-swift-faceId
//
//  Created by Liu Ziyi on 7/9/23.
//

import Foundation
import LocalAuthentication

class AuthenticationManager: ObservableObject {
    private(set) var context = LAContext()
    @Published private(set) var biometryType: LABiometryType = .none
    private(set) var canEvaluatePolicy = false
    @Published private(set) var isAuthenticated = false
    @Published private(set) var errorDescription: String?
    @Published var showAlert = false
    
    init() {
        getBiometryType()
    }
    
    func getBiometryType() {
        canEvaluatePolicy = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        biometryType = context.biometryType
    }
    
    func authenticateWithBiometrics() async {
        context = LAContext()
        
        if canEvaluatePolicy {
            let reason = "Log into your account"
            
            do {
                let success = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
                
                if success {
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                    }
                }
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.errorDescription = error.localizedDescription
                    self.showAlert = true
                    self.biometryType = .none 
                }
            }
        }
    }
    
    func authenticateWithCredentials(username: String, password: String) {
        if username.lowercased() == "kitten" && password == "kitten" {
            isAuthenticated = true
        } else {
            errorDescription = "Wrong credentials"
            showAlert = true 
        }
    }
    
    func logout() {
        isAuthenticated = false
    }
}
