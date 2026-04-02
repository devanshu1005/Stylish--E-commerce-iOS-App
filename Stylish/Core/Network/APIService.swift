import Foundation

class APIService {
    
    static let shared = APIService()
    
    func request<T: Decodable>(_ endpoint: String,
                              responseType: T.Type,
                              completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = URL(string: APIConstants.baseURL + endpoint) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        APIConstants.headers.forEach {
            request.setValue($1, forHTTPHeaderField: $0)
        }
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
