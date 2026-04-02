import SwiftUI

struct BannerView: View {
    
    let banners: [Banner]
    
    var body: some View {
        TabView {
            ForEach(banners, id: \.id) { banner in
                bannerCard(banner: banner)
            }
        }
        .frame(height: 200)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .padding(.horizontal, 16)
        .padding(.top, 10)
    }
    
    
    // 🔹 Single Banner Card
    func bannerCard(banner: Banner) -> some View {
        ZStack(alignment: .leading) {
            
            // 🖼 Background Image
            AsyncImage(url: URL(string: banner.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                    
                case .failure:
                    Color.gray.opacity(0.3)
                    
                @unknown default:
                    EmptyView()
                }
            }
            .frame(height: 189)
            .clipped()
            .cornerRadius(12)
            
            
            // 🌑 Overlay for readability
            LinearGradient(
                colors: [Color.black.opacity(0.6), Color.clear],
                startPoint: .leading,
                endPoint: .trailing
            )
            .cornerRadius(12)
            
            
            // 📝 Text Content
            VStack(alignment: .leading, spacing: 6) {
                
                Text(banner.title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                
                // Handle multiline subtitle
                ForEach(banner.subtitle.components(separatedBy: "\n"), id: \.self) { line in
                    Text(line)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                }
                
                // 🛍 CTA Button
                Button {
                    print("CTA tapped")
                } label: {
                    HStack(spacing: 4) {
                        Text(banner.cta)
                            .font(.system(size: 12, weight: .semibold))
                        
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .frame(height: 32)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.white, lineWidth: 1)
                    )
                }
                .padding(.top, 6)
            }
            .padding(.leading, 16)
        }
    }
}

#Preview {
    BannerView(banners: [
        Banner(
            id: 1,
            title: "50-40% OFF",
            subtitle: "Now in jeans\nAll colours",
            image: "https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da",
            cta: "Shop Now"
        )
    ])
}
