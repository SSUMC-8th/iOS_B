import SwiftUI
import Observation

@Observable
class SignupViewModel {
    var nickname: String = ""
    var email: String = ""
    var pwd: String = ""
}

struct ContentView3: View {
    @State private var SettingModel = SignupViewModel()
    @AppStorage("savedNickname") var savedNickname: String = ""
    @AppStorage("savedEmail") var savedEmail: String = ""
    @AppStorage("savedPassword") var savedPassword: String = ""
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                TextField("닉네임", text: $SettingModel.nickname)
                    Divider()
                    .padding(.bottom, 40)

                TextField("이메일", text: $SettingModel.email)
                    Divider()
                    .padding(.bottom, 40)
                
                TextField("비밀번호", text: $SettingModel.pwd)
                    Divider()
                    .padding(.bottom, 360)
                
                Button(action: {
                    saveUserInfo()
                }) {Image("생성 버튼 1")
                        .resizable()
                        .frame(width: 370, height: 54)
                }
            }
            .offset(y: 60)
            .padding(.horizontal, 20)
            
        }
    }
    func saveUserInfo() {
            savedNickname = SettingModel.nickname
            savedEmail = SettingModel.email
            savedPassword = SettingModel.pwd
            print("저장 완료")
    }
}

#Preview {
    ContentView3()
}
