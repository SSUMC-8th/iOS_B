import SwiftUI

struct AdPopupView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 0) {
            Image("광고팝업창")
                .resizable()
                .frame(width: 438, height: 720)

            Button(action: {
                print("자세히 보기")
            }) {
                Text("자세히 보기")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .medium))
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.green)
                    .cornerRadius(14)
                    .padding(.horizontal, 32)
            }
            .padding(.top, 12)

            HStack {
                Spacer()
                Button(action: {
                    dismiss()
                }) {
                    Text("X 닫기")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                }
                .padding(.trailing, 32)
                .padding(.top, 8)
            }

            Spacer()
        }
    }
}

#Preview {
    AdPopupView()
}
