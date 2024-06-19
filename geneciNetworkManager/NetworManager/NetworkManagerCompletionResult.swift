//
//  NetworkManagerCompletionResult.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 2/7/24.
//

import Foundation

class NetworkManagerCompletionResult {
    
    private init() {}
    
    static var share = NetworkManagerCompletionResult()
    
    //MARK: - EXAMPLES USING completion Handlers and swift result
    
    func request<T:Decodable>(endPoint: String,
                              methods: httpMethods,
                              completion: @escaping (Result<T, Error>) -> ()) {
        guard let url = URL(string: endPoint) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        request(url: url, methods: methods, completion: completion)
    }
    
    //MARK: - private func
    private func request<T:Decodable>(url: URL,
                                      methods: httpMethods,
                                      completion: @escaping (Result<T, Error>) -> ()) {
        
        var request = URLRequest(url: url)
        request.httpMethod = methods.rawValue
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                let dataError = NSError(domain:"No data recive", code:1000, userInfo:nil)
                completion(.failure(dataError))
                return
            }
            self.jsonDecode(data: data, completion: completion)
        }.resume()
    }
    
    private func jsonDecode<T:Decodable>(data: Data, completion: @escaping (Result<T, Error>) -> ()) {
        let decoder = JSONDecoder()
        
        do {
            let structData = try decoder.decode(T.self, from: data)
            completion(.success(structData))
        } catch {
            completion(.failure(error))
        }
    }
    
}
