import SwiftUI

struct SplashView: View {
    @Binding var currentScreen: AppScreen
    
    var body: some View {
        Image("SplashLogo")
            .resizable()
            .frame(width: 200, height: 80)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        currentScreen = .onboarding
                    }
                }
            }
    }
}

#Preview {
    SplashView(currentScreen: .constant(.splash))
}
