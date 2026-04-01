import SwiftUI

@main
struct StylishApp: App {
    
    @State private var currentScreen: AppScreen = .splash
    
    var body: some Scene {
        WindowGroup {
            switch currentScreen {
            case .splash:
                SplashView(currentScreen: $currentScreen)
            case .onboarding:
                OnboardingView(currentScreen: $currentScreen)
            case .login:
                LoginView()
            }
        }
    }
}

enum AppScreen {
    case splash
    case onboarding
    case login
}
