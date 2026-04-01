import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            DemoView1()
        } else {
            Image("SplashLogo")
                .resizable()
                .frame(width: 200, height: 80)
                .foregroundColor(.black)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}

