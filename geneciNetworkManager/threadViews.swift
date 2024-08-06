//
//  threadViews.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 8/5/24.
//

import UIKit

class threadViews: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        bankButton()
        SortingButton()
        
    }
    
    func bankButton() {
        let Bank = UIButton(frame: CGRect(x: 10, y: 100, width: 200, height: 40))
        Bank.backgroundColor = .systemBlue
        Bank.layer.cornerRadius = 5
        Bank.setTitle("bank", for: .normal)
        Bank.addTarget(self, action: #selector(goToBankView), for: .touchUpInside)
        view.addSubview(Bank)
    }
    
    func SortingButton() {
        let Bank = UIButton(frame: CGRect(x: 10, y: 200, width: 200, height: 40))
        Bank.backgroundColor = .systemBlue
        Bank.layer.cornerRadius = 5
        Bank.setTitle("Sorting", for: .normal)
        Bank.addTarget(self, action: #selector(goToSortView), for: .touchUpInside)
        view.addSubview(Bank)
    }
    
    @objc
    func goToBankView() {
        let bankView = bankRouter.getBank()
        navigationController?.pushViewController(bankView, animated: true)
    }
    
    @objc
    func goToSortView() {
        let sortingView = sortingView()
        navigationController?.pushViewController(sortingView, animated: true)
    }
}

#Preview {
    threadViews()
}
