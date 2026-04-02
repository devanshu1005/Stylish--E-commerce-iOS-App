protocol HomeRepositoryProtocol {
    func fetchHomeData(completion: @escaping (Result<HomeResponse, Error>) -> Void)
}

class HomeRepository: HomeRepositoryProtocol {
    
    func fetchHomeData(completion: @escaping (Result<HomeResponse, Error>) -> Void) {
        APIService.shared.request(
            APIConstants.homeEndpoint,
            responseType: HomeResponse.self,
            completion: completion
        )
    }
}
