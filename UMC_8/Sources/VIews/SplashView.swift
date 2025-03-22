//
//  SplashView.swift
//  UMC_8
//
//  Created by 소민준 on 3/20/25.
//


//
//  SplashView.swift
//  UMCStarBucks
//
//  Created by 소민준 on 3/18/25.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            LoginView() // 로그인 화면으로 이동
        } else {
            ZStack {
                Color("starColor")
                    .edgesIgnoringSafeArea(.all)
                
                Image("Starbuckslogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 168, height: 168)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}
#Preview {
    SplashView()
}
