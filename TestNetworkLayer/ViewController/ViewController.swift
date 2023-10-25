//
//  ViewController.swift
//  TestNetworkLayer
//
//  Created by Роман Грачик on 17.10.2023.
//

import SnapKit
import UIKit

final class ViewController: UIViewController {
    
    // MARK: - network service
    
    private var service: APIServiceProtocol?
    
    // MARK: - UI
    
    private var button = UIButton(type: .system)
    private var label = UILabel()
    
    // MARK: - init
    
    init(service: APIService) {
        
        super.init(nibName: nil, bundle: nil)
        self.service = service
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - override func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
    }
    
    // MARK: - private func
    
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
    
    // MARK: - @objc func
    
    @objc func get() {
        Task {
            do {
                let request = AccountRequestData()
                let result = try await service?.getAccounts(requestData: request)
                label.text = String(result?.accounts.count ?? 0)
            }
            catch {
                print(#function)
            }
        }
        
    }
}
