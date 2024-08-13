//
//  GDCViewViewController.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 9/19/23.
//

import UIKit

protocol GDCViewViewControllerProtocol: seUpViewProtocol {
    var router: GDCViewRouterProtocol? { get set }
}

class GDCViewViewController: UIViewController, GDCViewViewControllerProtocol {
    
    var router: GDCViewRouterProtocol?
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
    
    func setImageOneView(image: UIImage) {
        DispatchQueue.main.async {
            self.imageOneView.image = image
        }
    }
    
    func setImageTwoView(image: UIImage) {
        DispatchQueue.main.async {
            self.imageTwoView.image = image
        }
    }
    
    func setImageThreeView(image: UIImage) {
        DispatchQueue.main.async {
            self.imageThreeView.image = image
        }
    }
    
    @objc func serialFucn() {
        print("serialFucn")
        DispatchQueue.global().async {
            print("tara 1")
            Thread.sleep(forTimeInterval: 1)
            NetworManagerCompletionHandler.share.request(endPoint: self.endPoint) { image in
                guard let image = image else {
                    return
                }
                self.setImageOneView(image: image)
                print("fin tara 1")
            }
            Thread.sleep(forTimeInterval: 1)
            print("tara 2")
            NetworManagerCompletionHandler.share.request(endPoint: self.endPoint) { image in
                guard let image = image else {
                    return
                }
                self.setImageTwoView(image: image)
                print("fin tara 2")
            }
            Thread.sleep(forTimeInterval: 1)
            print(" tara 3")
            NetworManagerCompletionHandler.share.request(endPoint: self.endPoint) { image in
                guard let image = image else {
                    return
                }
                self.setImageThreeView(image: image)
                print("fin tara 3")
            }
        }
    }
    
    @objc func concurrentFucn() {
        let concurrentQueue = DispatchQueue(label: "swiftlee.concurrent.queue", attributes: .concurrent)
        print("Concurrente")
        concurrentQueue.async {
            print(" tara 1")
            Thread.sleep(forTimeInterval: 1)
            NetworManagerCompletionHandler.share.request(endPoint: self.endPoint) { image in
                guard let image = image else {
                    return
                }
                self.setImageOneView(image: image)
                print("fin tara 1")
            }
            print(" tara 2")
            Thread.sleep(forTimeInterval: 1)
            NetworManagerCompletionHandler.share.request(endPoint: self.endPoint) { image in
                guard let image = image else {
                    return
                }
                self.setImageTwoView(image: image)
                print("fin tara 2")
            }
            print(" tara 3")
            Thread.sleep(forTimeInterval: 1)
            NetworManagerCompletionHandler.share.request(endPoint: self.endPoint) { image in
                guard let image = image else {
                    return
                }
                self.setImageThreeView(image: image)
                print("fin tara 3")
            }
        }
    }
    
    @objc func dispatchGroup() {
        let group = DispatchGroup()
        var image1 = UIImage()
        var image2 = UIImage()
        var image3 = UIImage()
        DispatchQueue.global().async {
            group.enter()
            NetworManagerCompletionHandler.share.request(endPoint: self.endPoint) { image in
                guard let image = image else {
                    return
                }
                image1 = image
                group.leave()
            }
            
            group.enter()
            NetworManagerCompletionHandler.share.request(endPoint: self.endPoint) { image in
                guard let image = image else {
                    return
                }
                image2 = image
                group.leave()
            }
            
            group.enter()
            NetworManagerCompletionHandler.share.request(endPoint: self.endPoint) { image in
                guard let image = image else {
                    return
                }
                image3 = image
                group.leave()
            }
            
            group.wait()
            self.setImageOneView(image: image1)
            self.setImageTwoView(image: image2)
            self.setImageThreeView(image: image3)
            
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
    GDCViewViewController()
}
