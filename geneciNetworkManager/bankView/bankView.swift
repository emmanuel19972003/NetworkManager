//
//  bankView.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano on 23/07/24.
//

import Foundation
import UIKit

final class bankView: UIViewController, bankViewProtocol {
    var presenter: bankPresenterProtocol?
    //MARK: - ACCOUNT 1
    lazy var Account1Label: UILabel = {
        let label = UILabel()
        label.text = "  Account 1"
        label.backgroundColor = .systemGray6
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var Account1ValueLabel: UILabel = {
        let label = UILabel()
        label.text = " Value: "
        label.backgroundColor = .systemGray6
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var Account1DepositButton: UIButton = {
        let button = UIButton()
        button.setTitle("deposit", for: .normal)
        button.addTarget(self, action: #selector(depositAccount1), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var Account1WithdrawButton: UIButton = {
        let button = UIButton()
        button.setTitle("Withdraw", for: .normal)
        button.addTarget(self, action: #selector(WithdrawAccount1), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 25
        return button
    }()
    //MARK: - ACCOUNT 2
    lazy var Account2Label: UILabel = {
        let label = UILabel()
        label.text = "  Account 2"
        label.backgroundColor = .systemGray6
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var Account2ValueLabel: UILabel = {
        let label = UILabel()
        label.text = " Value 2: "
        label.backgroundColor = .systemGray6
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var Account2DepositButton: UIButton = {
        let button = UIButton()
        button.setTitle("deposit", for: .normal)
        button.addTarget(self, action: #selector(depositAccount2), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var Account2WithdrawButton: UIButton = {
        let button = UIButton()
        button.setTitle("Withdraw", for: .normal)
        button.addTarget(self, action: #selector(WithdrawAccount2), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 25
        return button
    }()
    //MARK: - ACCOUNT 3
    
    lazy var Account3Label: UILabel = {
        let label = UILabel()
        label.text = "  Account 3"
        label.backgroundColor = .systemGray6
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var Account3ValueLabel: UILabel = {
        let label = UILabel()
        label.text = " Value 3: "
        label.backgroundColor = .systemGray6
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var Account3DepositButton: UIButton = {
        let button = UIButton()
        button.setTitle("deposit", for: .normal)
        button.addTarget(self, action: #selector(depositAccount3), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var Account3WithdrawButton: UIButton = {
        let button = UIButton()
        button.setTitle("Withdraw", for: .normal)
        button.addTarget(self, action: #selector(WithdrawAccount3), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 25
        return button
    }()
    //MARK: - ACCOUNT 4
    
    lazy var Account4Label: UILabel = {
        let label = UILabel()
        label.text = "  Account 4"
        label.backgroundColor = .systemGray6
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var Account4ValueLabel: UILabel = {
        let label = UILabel()
        label.text = " Value 4: "
        label.backgroundColor = .systemGray6
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var Account4DepositButton: UIButton = {
        let button = UIButton()
        button.setTitle("deposit", for: .normal)
        button.addTarget(self, action: #selector(depositAccount4), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var Account4WithdrawButton: UIButton = {
        let button = UIButton()
        button.setTitle("Withdraw", for: .normal)
        button.addTarget(self, action: #selector(WithdrawAccount4), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 25
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        viewComponents()
        viewConstraints()
    }
    private func setUpView() {
        title = "bank view"
        view.backgroundColor = .white
    }
    private func viewComponents() {
        view.addSubview(Account1Label)
        view.addSubview(Account1ValueLabel)
        view.addSubview(Account1DepositButton)
        view.addSubview(Account1WithdrawButton)
        
        view.addSubview(Account2Label)
        view.addSubview(Account2ValueLabel)
        view.addSubview(Account2DepositButton)
        view.addSubview(Account2WithdrawButton)
        
        view.addSubview(Account3Label)
        view.addSubview(Account3ValueLabel)
        view.addSubview(Account3DepositButton)
        view.addSubview(Account3WithdrawButton)
        
        view.addSubview(Account4Label)
        view.addSubview(Account4ValueLabel)
        view.addSubview(Account4DepositButton)
        view.addSubview(Account4WithdrawButton)
        
    }
    
    private func viewConstraints() {
        Account1LabelConstraints()
        Account1ValueLabelConstraints()
        Account1DepositButtonConstraints()
        Account1WithdrawButtonConstraints()
        
        Account2LabelConstraints()
        Account2ValueLabelConstraints()
        Account2DepositButtonConstraints()
        Account2WithdrawButtonConstraints()
        
        Account3LabelConstraints()
        Account3ValueLabelConstraints()
        Account3DepositButtonConstraints()
        Account3WithdrawButtonConstraints()
        
        Account4LabelConstraints()
        Account4ValueLabelConstraints()
        Account4DepositButtonConstraints()
        Account4WithdrawButtonConstraints()
    }
    
    func upDateAccount1(value: String) {
        Account1ValueLabel.text = " Value: \(value)"
    }
    func upDateAccount2(value: String) {
        Account2ValueLabel.text = " Value: \(value)"
    }
    func upDateAccount3(value: String) {
        Account3ValueLabel.text = " Value: \(value)"
    }
    func upDateAccount4(value: String) {
        Account4ValueLabel.text = " Value: \(value)"
    }
    //MARK: - func ACCOUNT 1
    @objc func depositAccount1() {
        Task {
            await presenter?.depositAccount1()
        }
    }
    
    @objc func WithdrawAccount1() {
        Task {
            await presenter?.WithdrawAccount1()
        }
    }
    //MARK: - func ACCOUNT 2
    @objc func depositAccount2() {
        Task {
            await presenter?.depositAccount2()
        }
    }
    
    @objc func WithdrawAccount2() {
        Task {
            await presenter?.WithdrawAccount2()
        }
    }
    //MARK: - func ACCOUNT 3
    @objc func depositAccount3() {
        Task {
            await presenter?.depositAccount3()
        }
    }
    
    @objc func WithdrawAccount3() {
        Task {
            await presenter?.WithdrawAccount3()
        }
    }
    //MARK: - func ACCOUNT 4
    @objc func depositAccount4() {
        Task {
            await presenter?.depositAccount4()
        }
    }
    
    @objc func WithdrawAccount4() {
        Task {
            await presenter?.WithdrawAccount4()
        }
    }
    //MARK: - Constraints ACCOUNT 1
    func Account1LabelConstraints() {
        NSLayoutConstraint.activate([
            Account1Label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            Account1Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            Account1Label.widthAnchor.constraint(equalToConstant: 150),
            Account1Label.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func Account1ValueLabelConstraints() {
        NSLayoutConstraint.activate([
            Account1ValueLabel.topAnchor.constraint(equalTo: Account1Label.bottomAnchor, constant: 10),
            Account1ValueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            Account1ValueLabel.widthAnchor.constraint(equalToConstant: 150),
            Account1ValueLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func Account1DepositButtonConstraints() {
        NSLayoutConstraint.activate([
            Account1DepositButton.topAnchor.constraint(equalTo: Account1ValueLabel.bottomAnchor, constant: 10),
            Account1DepositButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            Account1DepositButton.widthAnchor.constraint(equalToConstant: 150),
            Account1DepositButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func Account1WithdrawButtonConstraints() {
        NSLayoutConstraint.activate([
            Account1WithdrawButton.topAnchor.constraint(equalTo: Account1DepositButton.bottomAnchor, constant: 10),
            Account1WithdrawButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            Account1WithdrawButton.widthAnchor.constraint(equalToConstant: 150),
            Account1WithdrawButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    //MARK: - Constraints ACCOUNT 2
    func Account2LabelConstraints() {
        NSLayoutConstraint.activate([
            Account2Label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            Account2Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            Account2Label.widthAnchor.constraint(equalToConstant: 150),
            Account2Label.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func Account2ValueLabelConstraints() {
        NSLayoutConstraint.activate([
            Account2ValueLabel.topAnchor.constraint(equalTo: Account2Label.bottomAnchor, constant: 10),
            Account2ValueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            Account2ValueLabel.widthAnchor.constraint(equalToConstant: 150),
            Account2ValueLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func Account2DepositButtonConstraints() {
        NSLayoutConstraint.activate([
            Account2DepositButton.topAnchor.constraint(equalTo: Account2ValueLabel.bottomAnchor, constant: 10),
            Account2DepositButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            Account2DepositButton.widthAnchor.constraint(equalToConstant: 150),
            Account2DepositButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func Account2WithdrawButtonConstraints() {
        NSLayoutConstraint.activate([
            Account2WithdrawButton.topAnchor.constraint(equalTo: Account2DepositButton.bottomAnchor, constant: 10),
            Account2WithdrawButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            Account2WithdrawButton.widthAnchor.constraint(equalToConstant: 150),
            Account2WithdrawButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    //MARK: - Constraints ACCOUNT 3
    func Account3LabelConstraints() {
        NSLayoutConstraint.activate([
            Account3Label.topAnchor.constraint(equalTo: Account1WithdrawButton.bottomAnchor, constant: 25),
            Account3Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            Account3Label.widthAnchor.constraint(equalToConstant: 150),
            Account3Label.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func Account3ValueLabelConstraints() {
        NSLayoutConstraint.activate([
            Account3ValueLabel.topAnchor.constraint(equalTo: Account3Label.bottomAnchor, constant: 10),
            Account3ValueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            Account3ValueLabel.widthAnchor.constraint(equalToConstant: 150),
            Account3ValueLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func Account3DepositButtonConstraints() {
        NSLayoutConstraint.activate([
            Account3DepositButton.topAnchor.constraint(equalTo: Account3ValueLabel.bottomAnchor, constant: 10),
            Account3DepositButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            Account3DepositButton.widthAnchor.constraint(equalToConstant: 150),
            Account3DepositButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func Account3WithdrawButtonConstraints() {
        NSLayoutConstraint.activate([
            Account3WithdrawButton.topAnchor.constraint(equalTo: Account3DepositButton.bottomAnchor, constant: 10),
            Account3WithdrawButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            Account3WithdrawButton.widthAnchor.constraint(equalToConstant: 150),
            Account3WithdrawButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    //MARK: - Constraints ACCOUNT 4
    func Account4LabelConstraints() {
        NSLayoutConstraint.activate([
            Account4Label.topAnchor.constraint(equalTo: Account2WithdrawButton.bottomAnchor, constant: 25),
            Account4Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            Account4Label.widthAnchor.constraint(equalToConstant: 150),
            Account4Label.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func Account4ValueLabelConstraints() {
        NSLayoutConstraint.activate([
            Account4ValueLabel.topAnchor.constraint(equalTo: Account4Label.bottomAnchor, constant: 10),
            Account4ValueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            Account4ValueLabel.widthAnchor.constraint(equalToConstant: 150),
            Account4ValueLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func Account4DepositButtonConstraints() {
        NSLayoutConstraint.activate([
            Account4DepositButton.topAnchor.constraint(equalTo: Account4ValueLabel.bottomAnchor, constant: 10),
            Account4DepositButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            Account4DepositButton.widthAnchor.constraint(equalToConstant: 150),
            Account4DepositButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func Account4WithdrawButtonConstraints() {
        NSLayoutConstraint.activate([
            Account4WithdrawButton.topAnchor.constraint(equalTo: Account4DepositButton.bottomAnchor, constant: 10),
            Account4WithdrawButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            Account4WithdrawButton.widthAnchor.constraint(equalToConstant: 150),
            Account4WithdrawButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

#Preview {
    bankView()
}
