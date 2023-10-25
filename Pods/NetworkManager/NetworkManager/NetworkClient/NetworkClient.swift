//
//  NetworkManager.swift
//  NetCore
//
//  Created by Роман Грачик on 16.10.2023.
//

import Foundation

public protocol NetworkClientProtocol {
    associatedtype Response: Decodable
    func performRequest<Response: Decodable>(request: any RequestDataProtocol) async throws -> Response
}

public struct AccountsResponseModel: Codable {
    let accounts: [AccountModel]
    let pageNumber, pageSize, totalElements: Int
}

// MARK: - Account
struct AccountModel: Codable {
    let id, accountNumber, accountName: String
    let balance: Int
    let currency, openDate, accountType: String
    let isMain: Bool
    let status: String

    enum CodingKeys: String, CodingKey {
        case id, accountNumber, accountName, balance, currency
        case openDate = "open_date"
        case accountType, isMain, status
    }
}


public final class NetworkClient: NetworkClientProtocol {
    public typealias Response = AccountsResponseModel
    
    // MARK: - init
    
    public init() {}
    
    // MARK: - methods
    
    public func performRequest<Response: Decodable>(request: any RequestDataProtocol) async throws -> Response {
        
        let urlRequest = request.createRequest()
        
        let session = URLSession(configuration: .default)
        
        do {
            let (data, response) = try await session.performDataTask(with: urlRequest!)
            if let httpResponse = response as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode
                let responseModel = try JSONDecoder().decode(Response.self, from: data)
                return responseModel
            } else {
                throw NetworkServiceErrors.invalidResponse
            }
        } catch {
            print("Произошла ошибка: \(error)")
            throw error
        }
        
    }
}
