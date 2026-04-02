import SwiftUI
import Kingfisher

struct BannerView: View {
    
    let banners: [Banner]
    
    var body: some View {
        TabView {
            ForEach(banners, id: \.id) { banner in
                bannerCard(banner: banner)
            }
        }
        .frame(height: 190)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .padding(.horizontal, 16)
        .padding(.top, 10)
    }
    
    func bannerCard(banner: Banner) -> some View {
        ZStack(alignment: .leading) {
          
            KFImage(URL(string: banner.image))
                .placeholder {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .onFailure { _ in
                    //
                }
                .resizable()
                .scaledToFill()
                .frame(height: 189)
                .background(
                    Color.gray.opacity(0.3)
                )
                .clipped()
                .cornerRadius(12)
            
            
            LinearGradient(
                colors: [Color.black.opacity(0.6), Color.clear],
                startPoint: .leading,
                endPoint: .trailing
            )
            .cornerRadius(12)
            
            
            VStack(alignment: .leading, spacing: 6) {
                
                Text(banner.title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                
                ForEach(banner.subtitle.components(separatedBy: "\n"), id: \.self) { line in
                    Text(line)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                }
              
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
