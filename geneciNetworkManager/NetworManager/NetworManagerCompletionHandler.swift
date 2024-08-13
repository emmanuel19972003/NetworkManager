//
//  NetworManagerCompletionHandler.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 2/7/24.
//

import UIKit


class NetworManagerCompletionHandler {
    
    //MARK: - init propeties
    private init () {}
    
    static var share = NetworManagerCompletionHandler()
    
    //MARK: - Func using completionHandlers and custom result
    
    func request<T:Decodable>(endPoint: String,
                              methods: httpMethods,
                              completion: @escaping (networkResponse<T>) -> ()) {
        
        guard let url = URL(string: endPoint) else {
            completion(.failure(error: URLError(.badURL)))
            return
        }
        request(url: url, methods: methods, completion: completion)
    }
    
    private func request<T:Decodable>(url: URL,
                                      methods: httpMethods,
                                      completion: @escaping (networkResponse<T>) -> ()) {
        
        var request = URLRequest(url: url)
        request.httpMethod = methods.rawValue
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                self.setErrorResponce(error: error, completion: completion)
                return
            }
            guard let data = data else {
                let dataError = NSError(domain:"Casting Error", code:1000, userInfo:nil)
                completion(.failure(error: dataError))
                return
            }
            self.jsonDecode(data: data, completion: completion)
            
        }.resume()
    }
    
    private func jsonDecode<T:Decodable>(data: Data, completion: @escaping (networkResponse<T>) -> ()) {
        let decoder = JSONDecoder()
        
        do {
            let structData = try decoder.decode(T.self, from: data)
            completion(.success(dataResponse: structData))
        } catch {
            completion(.failure(error: error))
        }
    }
    
    private func setErrorResponce<T:Decodable>(error: Error,completion: @escaping (networkResponse<T>) -> ()) {
        let errorCode = error._code
        if errorCode == -1009 {
            completion(.notConnectedToInternet)
        }
        else {
            completion(.failure(error: error))
        }
    }
    
    func request(endPoint: String,
                              methods: httpMethods = .GET,
                              completion: @escaping (UIImage?) -> ()) {
        
        guard let url = URL(string: endPoint) else {
            return completion(nil)
        }
        request(url: url, methods: methods, completion: completion)
    }
    
    private func request(url: URL,
                                      methods: httpMethods,
                                      completion: @escaping (UIImage?) -> ()) {
        
        var request = URLRequest(url: url)
        request.httpMethod = methods.rawValue
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completion(nil)
            }
            guard let data = data else {
                completion(nil)
                return
            }
            self.imageDecoder(data: data, completion: completion)
            
        }.resume()
    }
    
    private func imageDecoder(data: Data,  completion: @escaping (UIImage?) -> ()) {
        
        guard let image = UIImage(data: data) else {
            return completion(nil)
        }
        completion(image)
    }
    
}

