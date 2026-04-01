import SwiftUI

struct DemoView3: View {
    
    var body: some View {
        VStack {
            
            // 🔝 Top Bar
            HStack {
                Text("3/3")
                    .font(.system(size: 18, weight: .semibold))
                
                Spacer()
                
                Text("Skip")
                    .font(.system(size: 18, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            
            Spacer()
            
            // 🖼 Illustration
            Image("Onboarding3") // <-- add your asset image
                .resizable()
                .scaledToFit()
                .frame(height: 300)
            
            
            Spacer()
            
            // 📝 Title + Description
            VStack(spacing: 12) {
                Text("Get Your Order")
                    .font(.system(size: 24, weight: .bold))
                
                Text("Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            
            Spacer()
            
            // 🔘 Bottom Controls
            HStack {
                
                Text("Prev")
                    .font(.system(size: 18, weight: .semibold))
                
                Spacer()
                
                // Page Indicator
                HStack(spacing: 6) {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 8, height: 8)
                    
                    Capsule()
                        .fill(Color.black)
                        .frame(width: 30, height: 8)
                }
                
                Spacer()
                
                // Next Button
                Text("Get Started")
                    .font(.system(size: 18, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    DemoView3()
}
