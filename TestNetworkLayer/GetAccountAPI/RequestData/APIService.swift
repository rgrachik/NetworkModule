//
//  APIService.swift
//  TestNetworkLayer
//
//  Created by Роман Грачик on 17.10.2023.
//
import NetworkManager
import Foundation

protocol APIServiceProtocol: AnyObject {
    func getAccounts(requestData: AccountRequestData, queryItems: [URLQueryItem], headers: [String: String]) async throws -> (statusCode: Int, AccountsResponseModel)
}

final class APIService: APIServiceProtocol {
    
    //    let networkService = NetworkClient()
    
    func getAccounts(requestData: AccountRequestData, queryItems: [URLQueryItem], headers: [String: String]) async throws -> (statusCode: Int, AccountsResponseModel) {
        let request = requestData.createRequest(with: headers)
        let session = URLSession(configuration: .default)
        
        do {
            let (data, response) = try await session.performDataTask(with: request!)
            if let httpResponse = response as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode
                let responseModel = try JSONDecoder().decode(AccountsResponseModel.self, from: data)
                return (statusCode, responseModel)
            } else {
                throw NetworkServiceErrors.invalidResponse 
            }
        } catch {
            print("Произошла ошибка: \(error)")
            throw error
        }
    }


    
    
    
}

