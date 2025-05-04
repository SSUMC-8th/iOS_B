//
//  HomeView.swift
//  Starbucks
//
//  Created by 소민준 on 4/1/25.
//

import SwiftUI

struct HomeNavigationView: View {
    var body: some View {

        ZStack(alignment: .top){
            
            Image("homeTopImg")
            
            VStack(alignment: .leading){
                Spacer().frame(height: 120)
                Text("골든 미모사 그린 티와 함께\n행복한 새해의 축배를 들어요!")
                    .font(.system(size: 24))
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer().frame(height: 11)
                
                HStack{
                    Spacer()
                    Button(action: {}) {
                        Text("내용보기")
                            .font(Font.Pretend.pretendardRegular(size: 13))
                            .foregroundStyle(Color("gray06"))
                        Image("homeNavRight")
                    }
                    .frame(width: 78, height: 20)
                    
                    Spacer().frame(width: 11)
                    
                }
                
                Spacer().frame(height: 1)
                
                HStack{
                    HStack{
                    VStack(alignment: .leading){
                            //프로그레스바
                            Text("11★ until next Reward")
                                .foregroundStyle(Color("brown02"))
                                .frame(width: 191, height: 22)
                            ProgressView(value: 1, total: 12)
                                .frame(width: 255)
                                .scaleEffect(x: 1, y: 2, anchor: .center)
                                .tint(Color("brown02"))
                        }
                        // 별 개수 표시
                        Text("1")
                            .font(Font.Pretend.pretendardSemiBold(size: 38))
                        
                        // 별 개수 표시
                        Text("/")
                            .font(Font.Pretend.pretendardLight(size: 24))
                            .foregroundStyle(Color(hex: "#C9C9C9"))
                        
                        // 별 개수 표시
                        Text("12")
                            .font(Font.Pretend.pretendardSemiBold(size: 24))
                            .foregroundStyle(Color("brown02")) +
                        Text("★")
                            .font(Font.Pretend.pretendardSemiBold(size: 14))
                            .foregroundStyle(Color("brown02"))
                    }
                    .padding()
                    
                }
            }
                
        }.frame(maxWidth: .infinity, alignment: .top)
    }
}

struct HomeBearBannerView: View {
    var body: some View {
        Button(action: {}) {
            Image("HomeBearBanner")
        }
    }
}

struct userRecommendView: View {
    @AppStorage("nickname") var nickname: String = ""
    @StateObject var viewModel: RecommendMenuViewModel = .init()
    var body: some View {
        VStack(alignment: .leading) {
            Text(nickname.isEmpty ? "(작성한 닉네임)" : nickname)
                .foregroundStyle(Color("brown02"))
                .font(.system(size: 24)) +
            Text("님을 위한 추천 메뉴")
                .font(.system(size: 24))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack{
                ForEach(viewModel.recommendMenus){menu in
                    RecommendMenuCard(menu: menu)
                }
            }
        }
        .frame(height:160)
        .padding()
    }
}



struct RecommendMenuCard: View {
    var menu:userRecommendModel
    var body: some View {
            NavigationLink(destination: OrderMenuView(coffee: menu.coffees, selectedTemp: menu.coffees.selectedTemp)) {
                VStack{
                    Image(menu.menuImage)
                        .resizable()
                        .frame(width: 130, height: 130)
                    Text(menu.menuName)
                        .font(Font.Pretend.pretendardMedium(size: 14))
                        .foregroundStyle(Color("black02"))
                    
                }
            }
        }
}

struct RecommendMenuCard2: View {
    var menuImage:String
    var menuName:String
    
    var body: some View {
        Button(action: {}) {
            VStack{
                Image(menuImage)
                    .resizable()
                    .frame(width: 130, height: 130)
                Text(menuName)
                    .font(Font.Pretend.pretendardMedium(size: 14))
                    .foregroundStyle(Color("black02"))
                
            }
        }
    }
}

struct BloomingChouxPringBanner: View {
    var body: some View {
        Button(action: {}) {
            Image("BloomingChouxPring")
        }
    }
}

struct BuddyPassBanner: View {
    var body: some View {
        Button(action: {}) {
            Image("BuddyPass")
        }
    }
}

struct WhatsNewNewsCard: View {
    var NewsName: String
    var NewsContent: String
    var NewsImage: String
    var body: some View {
            Button(action: {}){
                VStack(alignment: .leading){
                    Image(NewsImage)
                        .resizable()
                        .frame(width: 242, height: 160)
                    Spacer().frame(height: 16)
                    VStack(alignment: .leading){
                        Text(NewsName)
                            .font(Font.Pretend.pretendardSemiBold(size: 18))
                            .foregroundStyle(Color("black02"))
                        Spacer().frame(height: 9)
                        Text(NewsContent)
                            .font(Font.Pretend.pretendardMedium(size: 13))
                            .foregroundStyle(Color("gray03"))
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)

                        
                    }
                    .frame(width: 235, alignment: .leading)
                        
                }
                
            }
    }
}

struct WhatsNewView: View {
    @AppStorage("nickname") var nickname: String = ""
    @StateObject var viewModel: WhatsNewViewModel = .init()
    var body: some View {
        VStack(alignment: .leading){
            Text("What's New")
                .font(Font.Pretend.pretendardLight(size: 24))
            
            ScrollView(.horizontal, showsIndicators: false){
                LazyHStack{
                    ForEach(viewModel.News){News in
                        WhatsNewNewsCard(NewsName: News.NewsName, NewsContent: News.NewsContent, NewsImage: News.NewsImage)
                    }
                }
            }
            .frame(height:249)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}


struct UpperbannerView: View {
    var body: some View {
        VStack{
            Button(action: {}) {
                Image("mugcupBanner")
            }
            
            Button(action: {}) {
                ZStack{
                    Image("OnlineStoreStarbanner")
                    VStack(alignment: .leading){
                        
                        Text("TIP")
                            .foregroundStyle(Color(hex: "#B6B6B6"))
                            .font(Font.Pretend.pretendardLight(size: 12))
                        
                        Spacer().frame(height: 4)
                        
                        Text("온라인 스토어\n별★ 적립 혜택")
                            .foregroundStyle(Color(hex: "#black03"))
                            .font(Font.Pretend.pretendardBold(size: 24))
                            .multilineTextAlignment(.leading)
                        
                        Spacer().frame(height: 16)
                        
                        Text("온라인 스토어 구매 시\n별★을 적립해 드립니다.")
                            .foregroundStyle(Color(hex: "##B6B6B6"))
                            .font(Font.Pretend.pretendardBold(size: 16))
                            .multilineTextAlignment(.leading)
                        
                    }
                    .frame(width: 311, alignment: .leading)
                    .padding()
                }
            }
            Button(action: {}) {
                Image("DeliveryBanner")
            }
        }
    }
}

struct BreadsRecommendView: View {
    @StateObject var viewModel: RecommendMenuViewModel = .init()
    var body: some View {
        VStack(alignment: .leading) {
            Text("하루가 달콤해지는 디저트")
                .font(Font.Pretend.pretendardSemiBold(size: 24))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack{
                ForEach(viewModel.recommendBreads){Bread in
                    RecommendMenuCard2(menuImage: Bread.menuImage, menuName: Bread.menuName)
                }
            }
        }
        .frame(height:160)
        .padding()
    }
}

struct BottomBannerView: View {
    var body: some View {
        VStack{
            Button(action: {}) {
                Image("ColdBrewBanner")
            }
            Button(action: {}) {
                Image("juiceBanner")
            }
            Button(action: {}) {
                Image("StarbucksCreateBanner")
            }
        }
    }
        
}


struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView(.vertical){
                HomeNavigationView()
                HomeBearBannerView()
                userRecommendView()
                BloomingChouxPringBanner()
                BuddyPassBanner()
                WhatsNewView()
                UpperbannerView()
                BreadsRecommendView()
                BottomBannerView()
            }
        }
    }
}



#Preview {
    HomeView()
}
