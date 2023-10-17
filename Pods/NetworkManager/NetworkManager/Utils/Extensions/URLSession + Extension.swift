//
//  URLSession + Extension.swift
//  NetworkManager
//
//  Created by Роман Грачик on 17.10.2023.
//

import Foundation

public extension URLSession  {
    func performDataTask(for request: URLRequest) async throws -> (Data, URLResponse) {
        try await withCheckedThrowingContinuation { continuation in
            dataTask(with: request) { data, response, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                
                guard let data = data, let response = response
                else {
                    continuation.resume(throwing: NetworkServiceErrors.emptyResponse)
                    return
                }
                
                continuation.resume(returning: (data, response))
            }
            .resume()
        }
    }
    
}
