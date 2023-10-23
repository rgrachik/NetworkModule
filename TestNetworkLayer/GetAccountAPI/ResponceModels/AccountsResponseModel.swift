//
//  AccountsResponseModel.swift
//  TestNetworkLayer
//
//  Created by Роман Грачик on 17.10.2023.
//

import Foundation

// MARK: - Welcome
struct AccountsResponseModel: Codable {
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
