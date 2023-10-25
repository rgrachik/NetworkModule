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
    
    var scheme: NetworkManager.Scheme = .http
    
    var baseURL: NetworkManager.BaseURL = .baseURL
    
    var port: NetworkManager.URLPort = .accountService
    
    var urlPath: NetworkManager.URLPath = .accounts
    
    var method: NetworkManager.Method = .get
    
    var headers: [String : String]? = ["X-Customer-Id": "f65f79b6-ff2b-467e-82e1-91dff7dbcf4c"]
    
    var queryItems: [URLQueryItem]?
}
