import SwiftUI

@main
struct StarbucksApp: App {
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
