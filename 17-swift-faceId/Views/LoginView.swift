//
//  LoginView.swift
//  17-swift-faceId
//
//  Created by Liu Ziyi on 6/9/23.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var authenticationManager: AuthenticationManager
    
    var body: some View {
        VStack(spacing: 40) {
            Title()
            
            switch authenticationManager.biometryType {
            case .faceID:
                PrimaryButton(image: "faceid", text: "Login with FaceID")
            case .touchID:
                PrimaryButton(image: "touchid", text: "Login with TouchID")
            default:
                PrimaryButton(image: "person.fill", text: "Login with your credentials")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthenticationManager())
    }
}
