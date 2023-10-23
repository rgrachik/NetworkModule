//
//  CodingProtocols.swift
//  NetworkManager
//
//  Created by Роман Грачик on 23.10.2023.
//

import Foundation

protocol CoderProtocol { }

extension CoderProtocol {
    
    func encodeData<T: Codable>(data: T) -> Data? {
        do {
            guard let data = try? JSONEncoder().encode(data) else {
                return nil
            }
            return data
        }
    }
        
    func decodeData<T: Codable>(type: T.Type, data: Data) -> Result<T, Error>? {
        do {
            guard let data = try? JSONDecoder().decode(T.self, from: data) else {
                return .failure(NetworkServiceErrors.decodingError)
            }
            return .success(data)
        }
    }
    
    func decodeJustData<T: Codable>(type: T.Type, data: Data) -> T? {
        do {
            guard let data = try? JSONDecoder().decode(T.self, from: data) else {
                return nil
            }
            return data
        }
    }
    
}
