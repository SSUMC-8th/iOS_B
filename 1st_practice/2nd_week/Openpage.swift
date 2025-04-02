import SwiftUI

struct Openpage: View {
    var body: some View {
        ZStack {
            Color("primaryColor")
                .ignoresSafeArea()
            
            Image(.background)
                .resizable()
                .frame(width: 168, height: 168)
            
        }
    }
}

#Preview {
    Openpage()
}
