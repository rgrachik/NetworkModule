//
//  AccountRequestData.swift
//  TestNetworkLayer
//
//  Created by Роман Грачик on 17.10.2023.
//

import NetworkManager
import Foundation

struct RequestBodyType {}

struct AccountRequestData: RequestDataProtocol {
    
    var bodyParams: RequestBodyType?
    
    typealias RequestBody = RequestBodyType
    
    var scheme: NetworkManager.Scheme
    
    var baseURL: NetworkManager.BaseURL
    
    var port: NetworkManager.URLPort
    
    var urlPath: NetworkManager.URLPath
    
    var method: NetworkManager.Method
    
    var headers: [String : String]?
    
    var queryItems: [URLQueryItem]?
    
}
