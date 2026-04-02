import SwiftUI
import Kingfisher

struct FeaturedCategoriesSection: View {
    
    let categories: [Category]
    
    var body: some View {
        VStack(spacing: 12) {
           
            HStack {
                Text("All Featured")
                    .font(.system(size: 18, weight: .semibold))
                
                Spacer()
                
                actionButton(title: "Sort", icon: "arrow.up.arrow.down")
                actionButton(title: "Filter", icon: "slider.horizontal.3")
            }
            .padding(.horizontal, 16)
            
            
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
    
    
    func categoryItemView(item: Category) -> some View {
        VStack(spacing: 6) {
            
            KFImage(URL(string: item.image))
                .placeholder {
                    ProgressView()
                        .frame(width: 56, height: 56)
                }
                .onFailure { _ in
                    //
                }
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56)
                .background(
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .padding(12)
                        .frame(width: 56, height: 56)
                        .background(Color.gray.opacity(0.2))
                )
                .clipShape(Circle())
            
            Text(item.title)
                .font(.system(size: 10))
                .foregroundColor(Color(hex: "#21003D"))
                .multilineTextAlignment(.center)
        }
    }
    
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
        Category(id: 1, title: "Beauty", image: "https://images.unsplash.com/photo-1596462502278-27bfdc403348"),
        Category(id: 2, title: "Fashion", image: "category2"),
        Category(id: 3, title: "Kids", image: "category3"),
        Category(id: 4, title: "Mens", image: "category4"),
        Category(id: 5, title: "Womens", image: "category5")
    ])
}
