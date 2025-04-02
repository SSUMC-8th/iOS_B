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
                Image(iconName)
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
            .frame(maxWidth: .infinity)
        }
    }
}


struct OtherView: View {
    @State private var viewModel = OtherViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                HStack {
                    Text("Other")
                        .font(.title2.bold())
                    Spacer()
                    Button(action: {
                        print("로그아웃")
                    }) {
                        Image("logout")
                            .resizable()
                            .frame(width: 35, height: 35)
                    }
                }
                .padding(.horizontal)
                .frame(height: 80)

                VStack(spacing: 4) {
                    Text("(\(viewModel.nickname)) 님")
                        .foregroundColor(.green)
                        .font(.title3.bold())
                    Text("환영합니다!🙌🏻")
                        .font(.subheadline)
                }

                HStack(spacing: 12) {
                    TopMenuButton(iconName: "star", label: "별 히스토리")
                    TopMenuButton(iconName: "receipt", label: "전자영수증")
                    TopMenuButton(iconName: "mymenu", label: "나만의 메뉴")
                }
                .padding(.horizontal)    .padding(.bottom, 24)


                VStack(alignment: .leading, spacing: 50) {
                    Text("Pay")
                        .font(.headline)
                        .padding(.leading)
                    HStack(spacing: 12){
                        RowMenuButton(iconName: "card", label: "스타벅스 카드 등록")
                        RowMenuButton(iconName: "card_change", label: "카드 교환권 등록")
                    }
                    HStack(spacing: 12){
                        RowMenuButton(iconName: "coupon", label: "쿠폰 등록")
                        RowMenuButton(iconName: "coupon_history", label: "쿠폰 히스토리")
                    }
                }

                Divider().padding(.horizontal).padding(.bottom, 24)


                VStack(alignment: .leading, spacing: 50) {
                    Text("고객지원")
                        .font(.headline)
                        .padding(.leading)
                    HStack(spacing: 12){
                        RowMenuButton(iconName: "store_care", label: "스토어 케어")
                        RowMenuButton(iconName: "customer_voice", label: "고객의 소리")
                    }
                    HStack(spacing: 12){
                        RowMenuButton(iconName: "store_info", label: "매장 정보")
                        RowMenuButton(iconName: "return_icon", label: "반납기 정보")
                    }
                        RowMenuButton(iconName: "my_review", label: "마이 스타벅스 리뷰")
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
