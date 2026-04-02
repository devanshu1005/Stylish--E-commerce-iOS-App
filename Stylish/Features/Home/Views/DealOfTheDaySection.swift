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
            
           
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(deal.products) { product in
                        ProductCard(product: product)
                    }
                }
                .padding(.horizontal, 15)
            }
        }
        .padding(.top, 10)
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
