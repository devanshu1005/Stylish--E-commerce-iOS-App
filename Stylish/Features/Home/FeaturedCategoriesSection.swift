import SwiftUI

struct FeaturedCategoriesSection: View {
    
    let categories: [CategoryItem]
    
    var body: some View {
        VStack(spacing: 12) {
            
            // 🔝 Header
            HStack {
                Text("All Featured")
                    .font(.system(size: 18, weight: .semibold))
                
                Spacer()
                
                actionButton(title: "Sort", icon: "arrow.up.arrow.down")
                actionButton(title: "Filter", icon: "slider.horizontal.3")
            }
            .padding(.horizontal, 16)
            
            
            // 🔄 Horizontal Categories
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(categories) { item in
                        categoryItemView(item: item)
                    }
                }
                .padding(.horizontal, 16)
            }
            .frame(height: 90)
        }
        .padding(.top, 10)
    }
    
    
    // 🔹 Category Item
    func categoryItemView(item: CategoryItem) -> some View {
        VStack(spacing: 6) {
            
            Image(item.image)
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56)
                .clipShape(Circle())
            
            Text(item.title)
                .font(.system(size: 10))
                .foregroundColor(Color(hex: "#21003D"))
                .multilineTextAlignment(.center)
        }
    }
    
    
    // 🔹 Action Button
    func actionButton(title: String, icon: String) -> some View {
        Button {
            print("\(title) tapped")
        } label: {
            HStack(spacing: 4) {
                Text(title)
                    .font(.system(size: 12))
                
                Image(systemName: icon)
                    .font(.system(size: 12))
            }
            .padding(.horizontal, 8)
            .frame(height: 24)
            .background(Color.white)
            .cornerRadius(6)
            .shadow(color: .black.opacity(0.08), radius: 4, x: 1, y: 1)
        }
    }
}

#Preview {
    FeaturedCategoriesSection(categories: [
        CategoryItem(title: "Beauty", image: "category1"),
        CategoryItem(title: "Fashion", image: "category2"),
        CategoryItem(title: "Kids", image: "category3"),
        CategoryItem(title: "Mens", image: "category4"),
        CategoryItem(title: "Womens", image: "category5")
    ])
}
