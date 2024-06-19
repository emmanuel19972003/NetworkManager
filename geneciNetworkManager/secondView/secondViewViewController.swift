//
//  secondViewViewController.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 9/19/23.
//

import UIKit

protocol secondViewViewControllerProtocol: seUpViewProtocol {
    var interactor: secondViewInteractorProtocol? { get set }
    var router: secondViewRputerProtocol? { get set }
}

class secondViewViewController: UIViewController, secondViewViewControllerProtocol {
    
    var interactor: secondViewInteractorProtocol?
    var router: secondViewRputerProtocol?
    var endPoint = "https://picsum.photos/200"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "GCD"
        view.backgroundColor = .white
        setupView()
    }
    
    private lazy var buttonOne: UIButton = {
        let button = UIButton()
        button.setTitle("GCD serial", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(serialFucn), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonConcurrent: UIButton = {
        let button = UIButton()
        button.setTitle("GCD concurrent", for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(concurrentFucn), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonGroup: UIButton = {
        let button = UIButton()
        button.setTitle("Dispatch group", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(dispatchGroup), for: .touchUpInside)
        return button
    }()
    
    private lazy var imageOneView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "suitcase.rolling")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var imageTwoView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "house.and.flag.fill")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var imageThreeView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "signpost.left.circle.fill")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    func viewComponets() {
        view.addSubview(buttonOne)
        view.addSubview(buttonConcurrent)
        view.addSubview(buttonGroup)
        view.addSubview(imageOneView)
        view.addSubview(imageTwoView)
        view.addSubview(imageThreeView)
        
    }
    
    func viewConstrains() {
        buttonOneConstrains()
        buttonConcurrentConstrains()
        buttonGroupConstrains()
        imageOneViewConstrains()
        imageTwoViewConstrains()
        imageThreeViewConstrains()
    }
    
    @objc func serialFucn() {
        let queueOne = DispatchQueue(label: "com.multithreading.concurr", qos: .utility)
        //        let queueOne = DispatchQueue.global(qos: .background)
        var bool1 = false
        var bool2 = false
        var bool3 = false
        queueOne.async {
            Task(priority: .background) {
//                try? await Task.sleep(for: 5.0)
                let image: UIImage = try await NetworkManagerAsyncThrows.share.request(endPoint: "https://picsum.photos/200")
                self.imageOneView.image = image
                bool1 = true
            }
        }
        
        queueOne.async {
            print("print 1")
            print("State of task 1: \(bool1)")
            print("State of task 2: \(bool2)")
            print("State of task 3: \(bool3)")
        }
        
        queueOne.async {
            Task(priority: .high) {
                let image: UIImage = try await NetworkManagerAsyncThrows.share.request(endPoint: "https://picsum.photos/200")
                self.imageTwoView.image = image
                bool2 = true
            }
        }
        
        queueOne.async {
            print("print 2")
            print("State of task 1: \(bool1)")
            print("State of task 2: \(bool2)")
            print("State of task 3: \(bool3)")
        }
        
        queueOne.async {
            Task(priority: .low) {
                let image: UIImage = try await NetworkManagerAsyncThrows.share.request(endPoint: "https://picsum.photos/200")
                self.imageThreeView.image = image
                bool3 = true
            }
        }
        queueOne.async {
            print("print 1")
            print("State of task 1: \(bool1)")
            print("State of task 2: \(bool2)")
            print("State of task 3: \(bool3)")
        }
        
    }
    
    @objc func concurrentFucn() {
        let anotherQueue = DispatchQueue(label: "otroHilo", qos: .background, attributes: .concurrent)
        //        let queueOne = DispatchQueue(label: "com.multithreading.concurr", qos: .utility)
        //        let anotherQueue = DispatchQueue.global(qos: .background)
        
        var bool1 = false
        var bool2 = false
        var bool3 = false
        anotherQueue.async {
            for i in 0..<30{
                print("🏓",i)
            }
            print("Done 1")
            bool1 = true
        }
        
        anotherQueue.async {
            print("print one")
            print("State of task 1: \(bool1)")
            print("State of task 2: \(bool2)")
            print("State of task 3: \(bool3)")
        }
        
        anotherQueue.async {
            for i in 30..<60{
                print("⚽️",i)
            }
            print("Done 2")
            bool2 = true
        }
        
        anotherQueue.async {
            print("print two")
            print("State of task 1: \(bool1)")
            print("State of task 2: \(bool2)")
            print("State of task 3: \(bool3)")
        }
        
        anotherQueue.async {
            for i in 60..<90{
                print("🦁",i)
            }
            print("Done 3")
            bool3 = true
        }
        
        anotherQueue.async {
            print("print three")
            print("State of task 1: \(bool1)")
            print("State of task 2: \(bool2)")
            print("State of task 3: \(bool3)")
        }
        
    }
    
    @objc func dispatchGroup() {
        let group = DispatchGroup()
        let queue = DispatchQueue(
            label: "com.theswiftdev.queues.serial"
        )
        
        queue.async(group: group) {
            print("group start")
            sleep(2)
            print("group end")
        }
    }
    
    func buttonOneConstrains() {
        NSLayoutConstraint.activate([
            buttonOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            buttonOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            buttonOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            buttonOne.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func buttonConcurrentConstrains() {
        NSLayoutConstraint.activate([
            buttonConcurrent.topAnchor.constraint(equalTo: buttonOne.bottomAnchor, constant: 25),
            buttonConcurrent.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            buttonConcurrent.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            buttonConcurrent.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func buttonGroupConstrains() {
        NSLayoutConstraint.activate([
            buttonGroup.topAnchor.constraint(equalTo: buttonConcurrent.bottomAnchor, constant: 25),
            buttonGroup.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            buttonGroup.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            buttonGroup.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func imageOneViewConstrains() {
        NSLayoutConstraint.activate([
            imageOneView.topAnchor.constraint(equalTo: buttonGroup.bottomAnchor, constant: 25),
            imageOneView.heightAnchor.constraint(equalToConstant: 100),
            imageOneView.widthAnchor.constraint(equalTo: imageOneView.heightAnchor),
            imageOneView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    func imageTwoViewConstrains() {
        NSLayoutConstraint.activate([
            imageTwoView.topAnchor.constraint(equalTo: imageOneView.bottomAnchor, constant: 25),
            imageTwoView.heightAnchor.constraint(equalToConstant: 100),
            imageTwoView.widthAnchor.constraint(equalTo: imageOneView.heightAnchor),
            imageTwoView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    func imageThreeViewConstrains() {
        NSLayoutConstraint.activate([
            imageThreeView.topAnchor.constraint(equalTo: imageTwoView.bottomAnchor, constant: 25),
            imageThreeView.heightAnchor.constraint(equalToConstant: 100),
            imageThreeView.widthAnchor.constraint(equalTo: imageOneView.heightAnchor),
            imageThreeView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
}

#Preview {
    secondViewViewController()
}
