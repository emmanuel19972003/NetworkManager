//
//  NetworManagerModels.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 9/14/23.
//

import Foundation

enum httpMethods: String {
    case GET
    case PUT
    case POST
    case DELETE
}

enum networkResponse<T: Decodable> {
    case success(dataResponse: T)
    case failure(error: Error)
    case notConnectedToInternet
}
