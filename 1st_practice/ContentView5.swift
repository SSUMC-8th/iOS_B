import SwiftUI
import Observation

@Observable
class OtherViewModel {
    var nickname: String {
        UserDefaults.standard.string(forKey: "savedNickname") ?? "(작성한 닉네임)"
    }
}

struct TopMenuButton: View {
    let iconName: String
    let label: String

    var body: some View {
        Button(action: {
            print(label)
        }) {
            VStack(spacing: 8) {
                Image("star")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text(label)
                    .font(.caption)
                    .foregroundColor(.black)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 1)
        }
    }
}


struct RowMenuButton: View {
    let iconName: String
    let label: String

    var body: some View {
        Button(action: {
            print(label)
        }) {
            HStack {
                Image(iconName)
                    .resizable()
                    .frame(width: 20, height: 20)
                Text(label)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}


struct OtherView: View {
    @State private var viewModel = OtherViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                HStack {
                    Text("Other")
                        .font(.title2.bold())
                    Spacer()
                    Button(action: {
                        print("로그아웃")
                    }) {
                        Image("logout_icon")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
                .padding(.horizontal)
                .frame(height: 80)

                VStack(spacing: 4) {
                    Text("(\(viewModel.nickname)) 님")
                        .foregroundColor(.green)
                        .font(.title3.bold())
                    Text("환영합니다! 👏🏼")
                        .font(.subheadline)
                }

                HStack(spacing: 12) {
                    TopMenuButton(iconName: "star_icon", label: "별 히스토리")
                    TopMenuButton(iconName: "receipt_icon", label: "전자영수증")
                    TopMenuButton(iconName: "mymenu_icon", label: "나만의 메뉴")
                }
                .padding(.horizontal)


                VStack(alignment: .leading, spacing: 8) {
                    Text("Pay")
                        .font(.headline)
                        .padding(.leading)

                    RowMenuButton(iconName: "card_register_icon", label: "스타벅스 카드 등록")
                    RowMenuButton(iconName: "card_exchange_icon", label: "카드 교환권 등록")
                    RowMenuButton(iconName: "coupon_register_icon", label: "쿠폰 등록")
                    RowMenuButton(iconName: "coupon_history_icon", label: "쿠폰 히스토리")
                }

                Divider().padding(.horizontal)


                VStack(alignment: .leading, spacing: 8) {
                    Text("고객지원")
                        .font(.headline)
                        .padding(.leading)

                    RowMenuButton(iconName: "storecare_icon", label: "스토어 케어")
                    RowMenuButton(iconName: "voice_icon", label: "고객의 소리")
                    RowMenuButton(iconName: "map_icon", label: "매장 정보")
                    RowMenuButton(iconName: "return_icon", label: "반납기 정보")
                    RowMenuButton(iconName: "review_icon", label: "마이 스타벅스 리뷰")
                }

                Spacer()
            }
            .padding(.top)
        }
    }
}

#Preview {
    OtherView()
}
