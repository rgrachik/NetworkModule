//
//  APIService.swift
//  TestNetworkLayer
//
//  Created by Роман Грачик on 17.10.2023.
//
import NetworkManager
import Foundation

protocol APIServiceProtocol: AnyObject {
    func getAccounts(requestData: AccountRequestData) async throws -> (AccountsResponseModel)
}

final class APIService: APIServiceProtocol {
    
    let client: any NetworkClientProtocol
    
    init(client: any NetworkClientProtocol) {
        self.client = client
    }
    
    //MARK: - getAllAccounts
    
    func getAccounts(requestData: AccountRequestData) async throws -> AccountsResponseModel {
        try await client.performRequest(request: requestData)
    }
    
}
