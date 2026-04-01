import SwiftUI

enum TabItem {
    case home, wishlist, cart, search, settings
}

struct BottomNavBar: View {
    
    @Binding var selectedTab: TabItem
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .fill(Color.white)
                .frame(height: 70)
                .shadow(color: .black.opacity(0.1), radius: 1, y: -1)
            
            
            HStack (spacing: 45){
                
                tabItem(icon: "house", title: "Home", tab: .home)
                
                tabItem(icon: "heart", title: "Wishlist", tab: .wishlist)
                
                Spacer(minLength: 10) // space for center button
                
                tabItem(icon: "magnifyingglass", title: "Search", tab: .search)
                
                tabItem(icon: "gearshape", title: "Setting", tab: .settings)
            }
            .padding(.horizontal, 20)
            
            
            // 🛒 Floating Cart Button
            VStack {
                Button {
                    selectedTab = .cart
                } label: {
                    Image(systemName: "cart")
                        .foregroundColor(.black)
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.15), radius: 6, y: 2)
                }
                .offset(y: -25)
                
//                Spacer()
            }
        }
    }
    
    
    // 🔹 Tab Item Builder
    func tabItem(icon: String, title: String, tab: TabItem) -> some View {
        Button {
            selectedTab = tab
        } label: {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .foregroundColor(selectedTab == tab ? Color(hex: "#EB3030") : .black)
                
                Text(title)
                    .font(.system(size: 12))
                    .foregroundColor(selectedTab == tab ? Color(hex: "#EB3030") : .black)
            }
        }
    }
}

#Preview {
    BottomNavBar(selectedTab: .constant(.home))
}
