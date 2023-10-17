//
//  RequestDataProtocol.swift
//  NetCore
//
//  Created by Роман Грачик on 17.10.2023.
//

import Foundation

/// общий протокол описывающий информацию для построения запроса
public protocol RequestDataProtocol {
    
    ///  сущность тела запроса
    associatedtype RequestBody
    
    var scheme: String { get }
    var baseURL: String { get }
    var port: Int { get }
    var method: Method { get }
    var headers: Headers { get set }
    var getParams: [URLQueryItem]? { get }
    var bodyParams: RequestBody? { get }
    var urlPath: String { get }
    
}

extension RequestDataProtocol {
    func createRequest (with headers: Headers) -> URLRequest? {
        guard let url = URL(string: baseURL.appending(urlPath))
                
        else {
            return nil
        }
        var urlRequest = URLRequest(url: url)
        
        if let params = getParams, !params.isEmpty {
            params.forEach{name, value in
                var queryItems = URLQueryItem(name: "", value: "")
                //URLrequest
            }
        }
        
        return urlRequest
    }
    
}
    
func createURLSession() -> URLSession {
    // Создайте настройки для вашей сессии (configuration)
    let sessionConfiguration = URLSessionConfiguration.default
    
    // Установите дополнительные параметры для настройки, если это необходимо
    // Например, установите таймауты, кеширование и другие параметры
    
    // Создайте и верните сессию с настройками
    let urlSession = URLSession(configuration: sessionConfiguration)
    
    return urlSession
}



public enum Method {
    case get
    case post
    case patch
}

public struct Headers {
    
    let defaultHeaders = [String: String]()
    
}
