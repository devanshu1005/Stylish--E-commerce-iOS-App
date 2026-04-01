import SwiftUI

struct OnboardingView: View {
    
    @State private var currentIndex = 0
    let onboardingItems: [OnboardingItem] = Bundle.main.decode("onboarding.json")
    
    var body: some View {
        VStack {
            
            HStack {
                Text("\(currentIndex + 1)/3")
                    .font(.system(size: 18, weight: .semibold))
                
                Spacer()
                
                Button("Skip") {
                    currentIndex = 2
                }
                .font(.system(size: 18, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            
            //Swipe Pages
            TabView(selection: $currentIndex) {
                
                ForEach(0..<3) { index in
                    let item = onboardingItems[index]
                    VStack {
                        
                        Spacer()
                        
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                        
                        Spacer()
                        
                        VStack(spacing: 12) {
                            Text(item.title)
                                .font(.system(size: 24, weight: .bold))
                            
                            Text(item.description)
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        
                        Spacer()
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            
            HStack {
                
                Button("Prev") {
                       if currentIndex > 0 {
                           currentIndex -= 1
                       }
                   }
                   .font(.system(size: 18, weight: .semibold))
                   .opacity(currentIndex == 0 ? 0 : 1)
                
                Spacer()
                
                // Page Indicator
                HStack(spacing: 6) {
                    ForEach(0..<3) { index in
                        if index == currentIndex {
                            Capsule()
                                .fill(Color.black)
                                .frame(width: 30, height: 8)
                        } else {
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 8, height: 8)
                        }
                    }
                }
                
                Spacer()
                
                Button("Next") {
                    if currentIndex < 2 {
                        currentIndex += 1
                    } else {
                        print("Go to Home/Login")
                    }
                }
                .font(.system(size: 18, weight: .semibold))
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    OnboardingView()
}
