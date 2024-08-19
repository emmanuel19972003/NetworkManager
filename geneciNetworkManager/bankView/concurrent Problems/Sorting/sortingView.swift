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
        linearSortButton()
        threadSortButton()
        nThreadSortButton()
        setText()
    }
    
    func linearSortButton() {
        let Bank = UIButton(frame: CGRect(x: 10, y: 400, width: viewWidth, height: 40))
        Bank.backgroundColor = .systemBlue
        Bank.layer.cornerRadius = 5
        Bank.setTitle("linear", for: .normal)
        Bank.addTarget(self, action: #selector(sortArrayLinear), for: .touchUpInside)
        view.addSubview(Bank)
    }
    
    func threadSortButton() {
        let Bank = UIButton(frame: CGRect(x: 10, y: 450, width: viewWidth, height: 40))
        Bank.backgroundColor = .systemBlue
        Bank.layer.cornerRadius = 5
        Bank.setTitle("Thread", for: .normal)
        Bank.addTarget(self, action: #selector(sortArrayThread), for: .touchUpInside)
        view.addSubview(Bank)
    }
    
    func nThreadSortButton() {
        let Bank = UIButton(frame: CGRect(x: 10, y: 500, width: viewWidth, height: 40))
        Bank.backgroundColor = .systemBlue
        Bank.layer.cornerRadius = 5
        Bank.setTitle("N Thread", for: .normal)
        Bank.addTarget(self, action: #selector(sortArrayNThread), for: .touchUpInside)
        view.addSubview(Bank)
    }
    
    func setText() {
        text = UITextView(frame: CGRect(x: 10, y: 350, width: viewWidth, height: 40))
        text.textColor = .black
        text.text = "Start!"
        view.addSubview(text)
    }
    
    @objc
    func sortArrayLinear() {
        DispatchQueue.global().async {
            self.setBackGroundColor(color: .red)
            self.setText(with: "Sorting...")
            self.timeSortFuncLinear()
            self.setBackGroundColor(color: .green)
            self.setText(with: "Sorted")
        }
    }
    
    func timeSortFuncLinear() {
        let arrayFunc = sorting().bubleSort(list: )
        let array1 = self.sort.createList()
        let sorted = self.sort.logger(testedFunc: arrayFunc, list: array1)
        print("linear exit? \(self.sort.checkList(list: sorted))")
    }
    
    func timeSortFuncThread() {
        let arrayFunc = sorting().threadSort(list:)
        let array1 = sort.createList()
        let sorted = sort.logger(testedFunc: arrayFunc, list: array1)
        print("thread exit? \(sort.checkList(list: sorted))")
    }
    
    @objc
    func sortArrayThread() {
        DispatchQueue.global().async {
            self.setBackGroundColor(color: .red)
            self.setText(with: "Sorting...")
            self.timeSortFuncThread()
            self.setBackGroundColor(color: .green)
            self.setText(with: "Sorted")
        }
    }
    
    func nThreadSort() {
        let array1 = sort.createList()
        let sorted = sorting().threadSort(list: array1, nOfThread: 10)
        print("thread exit? \(sort.checkList(list: sorted))")
    }
    
    @objc
    func sortArrayNThread() {
        DispatchQueue.global().async {
            self.setBackGroundColor(color: .red)
            self.setText(with: "Sorting...")
            self.nThreadSort()
            self.setBackGroundColor(color: .green)
            self.setText(with: "Sorted")
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
    sortingView()
}

