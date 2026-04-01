import SwiftUI

struct HomeView: View {
    
    @State private var searchText = ""
    @State private var selectedTab: TabItem = .home
    
    
    
    var homeContent: some View {
        VStack(spacing: 0) {
            
            HomeNavBar()
            
            SearchBarView(text: $searchText)
                .padding(.horizontal, 16)
                .padding(.top, 10)
            
            FeaturedCategoriesSection(categories: sampleCategories)
            
            Spacer()
            
            Text("Home")
                .font(.system(size: 24, weight: .bold))
            
            Spacer()
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
         
            // 🔄 Screen Switching
            ZStack {
                switch selectedTab {
                case .home:
                    homeContent
                case .wishlist:
                    WishlistView()
                case .cart:
                    CartView()
                case .search:
                    SearchScreenView()
                case .settings:
                    SettingsView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
            // 🔻 Bottom Bar (always visible)
            BottomNavBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(edges: .bottom)
        .background(Color(.systemGray6))
    }
}


#Preview {
    HomeView()
}
