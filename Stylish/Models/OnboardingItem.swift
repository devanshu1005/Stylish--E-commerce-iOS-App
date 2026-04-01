import Foundation

struct OnboardingItem: Identifiable, Codable {
    let id = UUID()
    let image: String
    let title: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case image, title, description
    }
}
