//
//  NetworkServiceErrors.swift
//  NetworkManager
//
//  Created by Роман Грачик on 17.10.2023.
//

import Foundation

public enum NetworkServiceErrors: Error {
    case emptyResponse
    case invalidResponse
    case decodingError
}
