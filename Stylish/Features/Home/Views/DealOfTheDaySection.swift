import SwiftUI

struct DealOfTheDaySection: View {
    
    let deal: DealSection
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            // 🔝 Header
            HStack {
                Text(deal.title)
                    .font(.system(size: 18, weight: .semibold))
                
                Spacer()
                
                // ⏳ Timer
                HStack(spacing: 4) {
                    Image(systemName: "clock")
                        .font(.system(size: 12))
                    
                    Text(deal.remainingTime)
                        .font(.system(size: 12))
                }
                .padding(.horizontal, 8)
                .frame(height: 24)
                .background(Color.red.opacity(0.1))
                .cornerRadius(6)
            }
            .padding(.horizontal, 16)
            
            
            // 🔄 Products Horizontal List
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 55) {
                    ForEach(deal.products) { product in
                        productCard(product: product)
                    }
                }
                .padding(.horizontal, 40)
            }
        }
        .padding(.top, 10)
    }
    
    
    // 🔹 Product Card
    func productCard(product: Product) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            
            // 🖼 Product Image
            AsyncImage(url: URL(string: product.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 180, height: 180)
                    
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                    
                case .failure:
                    Color.gray.opacity(0.2)
                    
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 180, height: 180)
            .clipped()
            .cornerRadius(10)
            
            
            // 🏷 Product Name
            Text(product.name)
                .font(.system(size: 12, weight: .medium))
                .lineLimit(2)
            
            
            // 💰 Price Row
            HStack(spacing: 6) {
                Text("₹\(product.price)")
                    .font(.system(size: 14, weight: .bold))
                
                Text("₹\(product.originalPrice)")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .strikethrough()
            }
            
            
            // 🔥 Discount
            Text(product.discount)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.red)
        }
        .frame(width: 140)
    }
}

#Preview {
    DealOfTheDaySection(
        deal: DealSection(
            title: "Deal of the Day",
            remainingTime: "22h 55m 20s",
            products: [
                Product(id: 1, name: "Kurta", image: " ", price: 1500, originalPrice: 2499, discount: "40% OFF"),
                Product(id: 2, name: "Kurta", image: " ", price: 1500, originalPrice: 2499, discount: "40% OFF"),
                Product(id: 3, name: "Kurta", image: " ", price: 1500, originalPrice: 2499, discount: "40% OFF"),
                Product(id: 4, name: "Kurta", image: " ", price: 1500, originalPrice: 2499, discount: "40% OFF")
            ]
        )
    )
}
