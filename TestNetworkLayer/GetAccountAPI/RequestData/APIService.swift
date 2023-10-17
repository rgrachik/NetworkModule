//
//  APIService.swift
//  TestNetworkLayer
//
//  Created by Роман Грачик on 17.10.2023.
//
import NetworkManager
import Foundation

protocol APIServiceProtocol {
    func getAccounts(requestData: AccountRequestData) async throws -> AccountsResponse
}

final class APIService: APIServiceProtocol {
    
    let netvorkService = NetworkClient()
    
    func getAccounts(requestData: AccountRequestData) async throws -> AccountsResponse {
        netvorkService.doThis()
    }
    
    
}
