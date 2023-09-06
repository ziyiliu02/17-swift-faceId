//
//  Title.swift
//  17-swift-faceId
//
//  Created by Liu Ziyi on 6/9/23.
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Authenticator")
            .font(.title)
            .bold()
            .foregroundColor(.white)
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
            .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}
