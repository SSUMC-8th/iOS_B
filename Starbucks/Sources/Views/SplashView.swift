//
//  SplashView.swift
//  Starbucks
//
//  Created by 박현규 on 3/18/25.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        if isActive {
            MainLoginView()
        }else{
            ZStack{
                Color(hex: "#01A862")
                    .ignoresSafeArea()
                Image("starbucks_Logo")
                    .resizable()
                    .frame(width: 168, height: 168)
            }
            .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.isActive = true
                    }
            }
        }
    }
    
}

#Preview {
    SplashView()
}
