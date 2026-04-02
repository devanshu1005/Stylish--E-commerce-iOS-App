import SwiftUI
import Kingfisher

struct ProductCard: View {
    
    let product: Product
    var width: CGFloat = 180
    var height: CGFloat = 180
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            // 🖼 Product Image
            KFImage(URL(string: product.image))
                .placeholder {
                    ProgressView()
                        .frame(width: width, height: height)
                }
                .onFailure { _ in
                    // You can handle error here if needed
                }
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .background(
                    ZStack {
                        Color.gray.opacity(0.2)
                        
                        Image(systemName: "photo")
                            .foregroundColor(.gray)
                    }
                )
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
        .frame(width: width)
    }
}

#Preview {
    ProductCard(
        product: Product(
            id: 1,
            name: "Sample Product",
            image: "https://images.unsplash.com/photo-1583394838336-acd977736f90",
            price: 999,
            originalPrice: 1999,
            discount: "50% OFF"
        )
    )
}
