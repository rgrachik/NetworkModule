//
//  ViewController.swift
//  TestNetworkLayer
//
//  Created by Роман Грачик on 17.10.2023.
//

import SnapKit
import UIKit

final class ViewController: UIViewController {
    
    let uuid = ["X-Customer-Id": "f65f79b6-ff2b-467e-82e1-91dff7dbcf4c"]
    
    private var service: APIServiceProtocol?
    
    private var button = UIButton(type: .system)
    private var label = UILabel()
    
    init(service: APIService) {
        
        super.init(nibName: nil, bundle: nil)
        self.service = service
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(button)
        view.addSubview(label)
        
        label.text = "0"
        label.textColor = UIColor.black
        
        button.setTitle("Get info", for: .normal)
        button.addTarget(self, action: #selector(get), for: .touchUpInside)
        
    }
    
    private func setupLayout() {
        
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(label.snp.bottom).offset(20)
        }
        
    }
    
    @objc func get() {
        Task {
            do {
                var queryItems: [URLQueryItem] = []
                queryItems.append(URLQueryItem(name: "statuses", value: ""))
                queryItems.append(URLQueryItem(name: "page", value: "0"))
                queryItems.append(URLQueryItem(name: "sort", value: "id,DESC"))
                
                if let (statusCode, data) = try await service?.getAccounts(
                    requestData: AccountRequestData(
                        scheme: .http,
                        baseURL: .baseURL,
                        port: .accountService,
                        urlPath: .accounts,
                        method: .get,
                        headers: uuid
                    ),
                    queryItems: queryItems, headers: uuid
                ) {
                    let count = data.accounts.count
                    self.label.text = "Number of accounts: \(count) status code \(statusCode)"
                } else {
                    print("Response is nil")
                }
            } catch {
                print(#function)
            }
        }
    }
    
}

