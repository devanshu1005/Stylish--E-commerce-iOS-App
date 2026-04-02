import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    private let repository: HomeRepositoryProtocol
    
    @Published var homeData: HomeData?
    @Published var isLoading = false
    
    var categories: [Category] {
        homeData?.categories ?? []
    }
    
    init(repository: HomeRepositoryProtocol = HomeRepository()) {
        self.repository = repository
    }
    
    func fetchHomeData() {
        isLoading = true
        
        repository.fetchHomeData { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                switch result {
                case .success(let response):
                    self?.homeData = response.data
                case .failure(let error):
                    print("Error:", error.localizedDescription)
                }
            }
        }
    }
}
