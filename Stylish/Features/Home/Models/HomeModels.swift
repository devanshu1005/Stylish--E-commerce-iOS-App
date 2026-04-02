import Foundation

struct HomeResponse: Decodable {
    let status: Bool
    let message: String
    let data: HomeData
}

struct HomeData: Decodable {
    let user: User
    let categories: [Category]
    let banners: [Banner]
    let dealOfTheDay: DealSection
    let offerBanner: OfferBanner
    let trendingProducts: ProductSection
    let newArrivals: NewArrivals
    let sponsored: Sponsored
    
    enum CodingKeys: String, CodingKey {
        case user, categories, banners
        case dealOfTheDay = "deal_of_the_day"
        case offerBanner = "offer_banner"
        case trendingProducts = "trending_products"
        case newArrivals = "new_arrivals"
        case sponsored
    }
}

// MARK: - Models

struct User: Decodable {
    let name: String
    let profileImage: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case profileImage = "profile_image"
    }
}

struct Category: Decodable, Identifiable {
    let id: Int
    let title: String
    let image: String
}

struct Banner: Decodable {
    let id: Int
    let title: String
    let subtitle: String
    let image: String
    let cta: String
}

struct DealSection: Decodable {
    let title: String
    let remainingTime: String
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case title, products
        case remainingTime = "remaining_time"
    }
}

struct ProductSection: Decodable {
    let title: String
    let date: String?
    let products: [Product]
}

struct Product: Decodable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let price: Int
    let originalPrice: Int
    let discount: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, price, discount
        case originalPrice = "original_price"
    }
}

struct OfferBanner: Decodable {
    let title: String
    let subtitle: String
    let image: String
    let cta: String
}

struct NewArrivals: Decodable {
    let title: String
    let subtitle: String
    let cta: String
}

struct Sponsored: Decodable {
    let title: String
    let image: String
}
