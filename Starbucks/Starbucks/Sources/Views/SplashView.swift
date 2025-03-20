//
//  SplashView.swift
//  Starbucks
//
//  Created by 박현규 on 3/18/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        
        ZStack{
            Color(hex: "#01A862")
                .ignoresSafeArea()
            Image("starbucks_Logo")
                .resizable()
                .frame(width: 168, height: 168)
        }
    }
}

#Preview {
    SplashView()
}
