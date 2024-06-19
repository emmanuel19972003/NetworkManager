//
//  NetworkManagerAsyncThrows.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 2/7/24.
//

import Foundation
import UIKit

class NetworkManagerAsyncThrows {
    
    private init() {}
    
    static let share = NetworkManagerAsyncThrows()
    
    // MARK: - EXAMPLE USING Async/Await throws
    
    func request<T: Decodable>(endPoint: String,
                               methods: httpMethods) async throws -> T {
        
        guard let url = URL(string: endPoint) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = methods.rawValue
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return try jsonDecode(data: data)
        } catch {
            throw error
        }
    }
    
    func requestMain<T: Decodable>(endPoint: String,
                                   methods: httpMethods) async throws -> T {
        guard let url = URL(string: endPoint) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = methods.rawValue
            do {
                
                let (data, _) = try await URLSession.shared.data(for: request)
                let value: T = try jsonDecode(data: data)
                return await MainActor.run {
                    return value
                }
            } catch {
                throw error
            }
        
    }
    
    private func jsonDecode<T:Decodable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        
        do {
            let structData = try decoder.decode(T.self, from: data)
            return structData
        } catch {
            throw error
        }
    }
    
    
    
    func request(endPoint: String) async throws -> UIImage {
        
        guard let url = URL(string: endPoint) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return try imageDecoder(data: data)
        } catch {
            throw error
        }
    }
    
    private func imageDecoder(data: Data) throws -> UIImage {
        
        guard let image = UIImage(data: data) else {
            throw NSError(domain:"No data recive", code:1000, userInfo:nil)
        }
        return image
    }
}
