//
//  sortingView.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 8/5/24.
//

import UIKit

class primeViewController: UIViewController {
    
    var text = UITextView()
    let sort = sorting()
    
    let viewWidth = UIScreen.main.bounds.size.width - 20
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        linearSortButton()
        setTextLabel()
    }
    
    func linearSortButton() {
        let Bank = UIButton(frame: CGRect(x: 10, y: 400, width: viewWidth, height: 40))
        Bank.backgroundColor = .systemBlue
        Bank.layer.cornerRadius = 5
        Bank.setTitle("linear", for: .normal)
        Bank.addTarget(self, action: #selector(checkForPrime), for: .touchUpInside)
        view.addSubview(Bank)
    }
    
    func setTextLabel() {
        text = UITextView(frame: CGRect(x: 10, y: 350, width: viewWidth, height: 40))
        text.textColor = .black
        text.text = "Start!"
        view.addSubview(text)
    }
    
    @objc
    func checkForPrime() {
        DispatchQueue.global().async {
            let claculadora = primeProblem(listOfNumbers: [953,6,10,6,8,6,5])
            let result = claculadora.checkForPrims()
            print(result)
        }
    }
    
    
    func setBackGroundColor(color: UIColor) {
        DispatchQueue.main.async {
            self.view.backgroundColor = color
        }
    }
    
    func setText(with text: String) {
        DispatchQueue.main.async {
            self.text.text = text
        }
    }
}

#Preview {
    primeViewController()
}

