import SwiftUI
import Kingfisher

struct OfferBannerSection: View {
    
    let banner: OfferBanner
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            // 🖼 Background Image
            KFImage(URL(string: banner.image)).fade(duration: 0.25)
                .placeholder {
                    ProgressView()
                        .frame(height: 160)
                }
                .onFailure { _ in
                    // Optional: handle error if needed
                }
                .resizable()
                .scaledToFill()
                .frame(height: 160)
                .background(
                    Color.gray.opacity(0.2)
                )
                .clipped()
                .cornerRadius(12)
            
            
            // 🌑 Overlay for readability
            LinearGradient(
                colors: [Color.black.opacity(0.6), Color.clear],
                startPoint: .leading,
                endPoint: .trailing
            )
            .cornerRadius(12)
            
            
            // 📝 Content
            VStack(alignment: .leading, spacing: 6) {
                
                Text(banner.title)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                
                Text(banner.subtitle)
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                
                Button {
                    print("Offer CTA tapped")
                } label: {
                    HStack(spacing: 4) {
                        Text(banner.cta)
                            .font(.system(size: 12, weight: .semibold))
                        
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .frame(height: 30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.white, lineWidth: 1)
                    )
                }
                .padding(.top, 6)
            }
            .padding(.leading, 16)
        }
        .padding(.horizontal, 16)
        .padding(.top, 10)
    }
}

#Preview {
    OfferBannerSection(
        banner: OfferBanner(
            title: "Flat and Heels",
            subtitle: "Stand a chance to get rewarded",
            image: "https://images.unsplash.com/photo-1582142306909-195724d0d16b",
            cta: "Visit now"
        )
    )
}
