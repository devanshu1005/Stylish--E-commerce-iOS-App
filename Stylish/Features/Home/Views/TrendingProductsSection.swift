import SwiftUI

struct TrendingProductsSection: View {
    
    let section: ProductSection
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            VStack(alignment: .leading, spacing: 4) {
                Text(section.title)
                    .font(.system(size: 18, weight: .semibold))
                
                if let date = section.date {
                    Text(date)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 16)
            
            
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(section.products) { product in
                    ProductCard(product: product, width: 170, height: 170)
                }
            }
            .padding(.horizontal, 16)
        }
        .padding(.top, 10)
    }
}

#Preview {
    TrendingProductsSection(
        section: ProductSection(
            title: "Trending Productsss",
            date: "Last Date 29/02/22",
            products: [
                Product(id: 1, name: "Watch", image: "https://images.unsplash.com/photo-1583394838336-acd977736f90", price: 650, originalPrice: 1599, discount: "60% OFF"),
                Product(id: 2, name: "Watch", image: "https://images.unsplash.com/photo-1583394838336-acd977736f90", price: 650, originalPrice: 1599, discount: "60% OFF"),
                Product(id: 3, name: "Watch", image: "https://images.unsplash.com/photo-1583394838336-acd977736f90", price: 650, originalPrice: 1599, discount: "60% OFF")
            ]
        )
    )
}
