//
//  ContentView.swift
//  17-swift-faceId
//
//  Created by Liu Ziyi on 6/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            LoginView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
