import SwiftUI

struct HomeView: View {
    
    @State private var searchText = ""
    @State private var selectedTab: TabItem = .home
    @StateObject private var viewModel = HomeViewModel()
    
    var homeContent: some View {
        ScrollView{
            VStack(spacing: 0) {
                
                HomeNavBar()
                
                SearchBarView(text: $searchText)
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                
                FeaturedCategoriesSection(categories: viewModel.categories)
                
                if let banners = viewModel.homeData?.banners {
                            BannerView(banners: banners)
                        }
                
                if let deal = viewModel.homeData?.dealOfTheDay {
                          DealOfTheDaySection(deal: deal)
                      }
                
                if let trending = viewModel.homeData?.trendingProducts {
                                TrendingProductsSection(section: trending)
                            }
                
                Spacer(minLength: 20)
                
            }
        }
       
        .onAppear {
            viewModel.fetchHomeData()
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
