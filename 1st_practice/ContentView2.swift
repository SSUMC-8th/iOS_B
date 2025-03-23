import SwiftUI

struct ContentView2: View {
    var body: some View {
        VStack(spacing: 32) {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Image("background")
                        .resizable()
                        .frame(width: 97, height: 95)
                    Spacer()
                }
                //주석처리
                
                Text("안녕하세요.")
                    .font(.mainTextBold24)
                Text("스타벅스입니다.")
                    .font(.mainTextBold24)
                Text("회원 서비스 이용을 위해 로그인해주세요")
                    .font(.mainTextMedium16)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 24)
            
            VStack(spacing: 16) {
                VStack(alignment: .leading) {
                    Text("아이디")
                        .font(.mainTextRegular13)
                    TextField("", text: .constant(""))
                        .padding(.bottom, 4)
                    Divider()
                }
                
                VStack(alignment: .leading) {
                    Text("비밀번호")
                        .font(.mainTextRegular13)
                    SecureField("", text: .constant(""))
                        .padding(.bottom, 4)
                    Divider()
                }
            }
            .padding(.horizontal, 24)
            
            VStack(spacing: 16) {
                Button(action: {
                    print("로그인하기 버튼 클릭")
                }) {
                    Text("로그인하기")
                        .font(.mainTextMedium16)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(8)
                }
                
                Text("이메일로 회원가입하기")
                    .font(.mainTextRegular12)
                    .foregroundColor(.gray)
                    .underline()
            }
            .padding(.horizontal, 24)
            
            VStack(spacing: 8) {
                Image("kakao_login")
                    .resizable()
                    .frame(height: 44)
                
                Image("apple_login")
                    .resizable()
                    .frame(height: 44)
            }
            .padding(.horizontal, 24)
            
            Spacer()
        }
        .padding(.top, 40)
    }
}

#Preview {
    ContentView2()
}
