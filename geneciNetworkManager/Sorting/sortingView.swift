//
//  sortingView.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 8/5/24.
//

import UIKit

class sortingView: UIViewController {
    
    var text = UITextView()
    let sort = sorting()
    
    let viewWidth = UIScreen.main.bounds.size.width - 20
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        sortButton()
        setText()
    }
    
    func sortButton() {
        let Bank = UIButton(frame: CGRect(x: 10, y: 400, width: viewWidth, height: 40))
        Bank.backgroundColor = .systemBlue
        Bank.layer.cornerRadius = 5
        Bank.setTitle("bank", for: .normal)
        Bank.addTarget(self, action: #selector(sortArray), for: .touchUpInside)
        view.addSubview(Bank)
    }
    
    func setText() {
        text = UITextView(frame: CGRect(x: 10, y: 350, width: viewWidth, height: 40))
        text.textColor = .black
        text.text = "Start!"
        view.addSubview(text)
    }
    
    @objc
    func sortArray() {
        DispatchQueue.global().async {
            self.setBackGroundColor(color: .red)
            self.setText(with: "Sorting...")
            self.timeSortFuncThread()
            self.setBackGroundColor(color: .green)
            self.setText(with: "Sorted")
        }
    }
    
    func sortFunc() {
        let array1 = sort.createList()
        
        let sorted = sort.threadSort(list: array1)
        print("exit? \(sort.checkList(list: sorted))")
    }
    func timeSortFuncThread() {
        let arrayFunc = sorting().threadSort(list:)
        let array1 = sort.createList()
        let sorted = sort.logger(testedFunc: arrayFunc, list: array1)
        print("thread exit? \(sort.checkList(list: sorted))")
    }
    
    func timeSortFuncLinear() {
        let arrayFunc = sorting().bubleSort(list: )
        let array1 = self.sort.createList()
        let sorted = self.sort.logger(testedFunc: arrayFunc, list: array1)
        print("linear exit? \(self.sort.checkList(list: sorted))")
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
    sortingView()
}

