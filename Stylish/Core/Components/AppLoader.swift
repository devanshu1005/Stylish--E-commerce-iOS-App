import SwiftUI

struct AppLoader: View {
    
    var message: String = "Loading..."
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .ignoresSafeArea()
            
            VStack(spacing: 12) {
                ProgressView()
                
                Text(message)
                    .font(.system(size: 14, weight: .medium))
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
        }
    }
}

#Preview {
    AppLoader(message: "Logging in...")
}
