//
//  RequestDataProtocol.swift
//  NetCore
//
//  Created by Роман Грачик on 17.10.2023.
//

import Foundation

public protocol RequestDataProtocol {
    associatedtype RequestBody
    
    var scheme: Scheme { get }
    var baseURL: BaseURL { get }
    var port: URLPort { get }
    var urlPath: URLPath { get }
    var method: Method { get }
    var headers: [String: String]? { get set }
    var queryItems: [URLQueryItem]? { get }
    var bodyParams: RequestBody? { get }
}

public extension RequestDataProtocol {
    func createRequest(with headers: [String: String]) -> URLRequest? {
        let urlString = "\(scheme)://\(baseURL.rawValue):\(port.rawValue)/\(urlPath.rawValue)"
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        for (key, value) in headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        if let params = queryItems, !params.isEmpty {
            if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) {
                urlComponents.queryItems = params
                urlRequest.url = urlComponents.url
            }
        }
        
        if let body = bodyParams {
            do {
                let bodyData = try JSONSerialization.data(withJSONObject: body)
                urlRequest.httpBody = bodyData
            } catch {
                return nil
            }
        }
        
        return urlRequest
    }
}


public enum Method: String {
    case get
    case post
    case patch
}

public enum Scheme: String {
    case http
    case https
}

public enum URLPort: Int {
    case absApiGatewayService = 30086
    case absUserService = 30085
    case accountService = 30080
    case cardService = 30071
    case creditService = 30073
    case customerService = 30070
    case depositService = 30074
    case infoService = 30084
    case insuranceDocumentService = 30082
    case insuranceService = 30081
    case userAccount = 30072
}

public enum BaseURL: String {
    case baseURL = "172.17.1.79"
}

public enum URLPath: String {
    case showAllAccounts = "accounts"
}


// http://172.17.1.79:30080/accounts/b3e3eb5c-23c5-4e5c-b24b-430115009d4b/requisites аккаунт айди в середине пути
