import SwiftUI

struct HomeView: View {
    
    @State private var searchText = ""
    @State private var selectedTab: TabItem = .home
    @StateObject private var viewModel = HomeViewModel()
    @State private var showMenu = false
    @State private var offset: CGFloat = -300
    
    var homeContent: some View {
        ScrollView{
            VStack(spacing: 0) {
                
                HomeNavBar(onMenuTap: {
                    openMenu()
                })
                
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
                
                if let offer = viewModel.homeData?.offerBanner {
                    OfferBannerSection(banner: offer)
                }
                
                if let trending = viewModel.homeData?.trendingProducts {
                                TrendingProductsSection(section: trending)
                            }
                
                Spacer(minLength: 20)
                
            }
        }
    }
    
    // MARK: - Main Body
    
    var body: some View {
        ZStack {
            
            // MAIN CONTENT
            VStack(spacing: 0) {
                
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
                } .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                BottomNavBar(selectedTab: $selectedTab)
            }.onAppear {
                viewModel.fetchHomeData()
            }
            .disabled(showMenu)
            
            // DIM BACKGROUND
            if showMenu {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        closeMenu()
                    }
            }
            
            // SIDE MENU
            HStack {
                SideMenuView()
                    .frame(width: 300)
                    .offset(x: offset)
                
                Spacer()
            }
        }
        .gesture(
                   DragGesture()
                       .onChanged { value in
                           if value.translation.width < 0 {
                               offset = max(value.translation.width, -300)
                           }
                       }
                       .onEnded { value in
                           if value.translation.width < -100 {
                               closeMenu()
                           } else {
                               openMenu()
                           }
                       }
               )
    }
    
    // MARK: - functions
    
    private func openMenu() {
        withAnimation {
            showMenu = true
            offset = 0
        }
    }

    private func closeMenu() {
        withAnimation {
            showMenu = false
            offset = -300
        }
    }
}




#Preview {
    HomeView()
}
