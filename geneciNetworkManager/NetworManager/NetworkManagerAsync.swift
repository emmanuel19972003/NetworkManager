//
//  NetworkManagerAsync.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 2/7/24.
//

import Foundation


class NetworkManagerAsync {
    
    private init() {}
    
    static var share = NetworkManagerAsync()
    //MARK: - EXAMPLE USING Async/Await
    
    func request<T:Decodable>(endPoint: String,
                              methods: httpMethods) async -> (Result<T, Error>) {
        guard let url = URL(string: endPoint) else {
            return .failure(URLError(.badURL))
        }
        let response: Result<T, Error> = await request(url: url, methods: methods)
        return response
    }
    
    private func request<T:Decodable>(url: URL,
                                      methods: httpMethods) async -> (Result<T, Error>) {
        
        var request = URLRequest(url: url)
        request.httpMethod = methods.rawValue
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return jsonDecode(data: data)
        } catch {
            return .failure(error)
        }
    }
    
    private func jsonDecode<T:Decodable>(data: Data) -> (Result<T, Error>){
        let decoder = JSONDecoder()
        
        do {
            let structData = try decoder.decode(T.self, from: data)
            return .success(structData)
        } catch {
            return .failure(error)
        }
    }
}
