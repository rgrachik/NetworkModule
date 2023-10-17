//
//  GetAccountModel.swift
//  TestNetworkLayer
//
//  Created by Роман Грачик on 17.10.2023.
//

import Foundation

// MARK: - Welcome
struct AccountsModel: Codable {
    let accounts: [Account]
    let pageNumber, pageSize, totalElements: Int
}

// MARK: - Account
struct Account: Codable {
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
