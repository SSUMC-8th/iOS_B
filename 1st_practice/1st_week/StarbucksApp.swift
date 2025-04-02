import SwiftUI

@main
struct _st_practiceApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                StarbucksTabView()
            } else {
                NavigationStack {
                    LoginView()
                }
            }
        }
    }
}
