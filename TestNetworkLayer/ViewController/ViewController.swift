//
//  ViewController.swift
//  TestNetworkLayer
//
//  Created by Роман Грачик on 17.10.2023.
//

import NetworkManager
import SnapKit
import UIKit

class ViewController: UIViewController {
    
    var service: APIServiceProtocol?
    
    private var button = UIButton(type: .system)
    private var label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        setupLayout()
    }

    private func setupUI() {
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
                let response = try await service?.getAccounts(requestData: <#T##AccountRequestData#>)
            } catch {
                // show alert
            }
        }
        
    }
    

}

