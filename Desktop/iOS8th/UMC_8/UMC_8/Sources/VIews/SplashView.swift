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
    var body: some View {
        ZStack {
            
            Color("starColor")
                .edgesIgnoringSafeArea(.all)
            
            // 스타벅스 로고
            Image("Starbuckslogo")  // Assets.xcassets에 추가된 이미지 이름
                .resizable()
                .scaledToFit()
                .frame(width: 168, height: 168) // 원하는 크기로 조정
        }
    }
}
#Preview {
    SplashView()
}
