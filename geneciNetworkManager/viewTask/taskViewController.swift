//
//  taskViewController.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 9/28/23.
//

import UIKit

class taskViewController: UIViewController, seUpViewProtocol {
    
    var endPoint = "https://picsum.photos/200"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Task"
        view.backgroundColor = .white
        setupView()
    }
    
    private lazy var serialCallButton: UIButton = {
        let button = UIButton()
        button.setTitle("Serial Call Button", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(makeAcall), for: .touchUpInside)
        return button
    }()
    
    private lazy var concurrentCallButton: UIButton = {
        let button = UIButton()
        button.setTitle("Concurrent ", for: .normal)
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(makeAConcurrentAcall), for: .touchUpInside)
        return button
    }()
    
    private lazy var callLetAsync: UIButton = {
        let button = UIButton()
        button.setTitle("maka a call for image", for: .normal)
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(makeAsyncLet), for: .touchUpInside)
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
        image.image = UIImage(systemName: "iphone.gen2")
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var imageThreeView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "car.rear.and.tire.marks")
        image.tintColor = .systemYellow
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    func viewComponets() {
        view.addSubview(serialCallButton)
        view.addSubview(concurrentCallButton)
        view.addSubview(imageOneView)
        view.addSubview(imageTwoView)
        view.addSubview(imageThreeView)
        view.addSubview(callLetAsync)
    }
    
    func viewConstrains() {
        buttonGroupConstrains()
        concurrentCallButtonConstrains()
        callLetAsyncConstrains()
        imageOneViewConstrains()
        imageTwoViewConstrains()
        imageThreeViewConstrains()
    }
    
    @objc func makeAcall() {
        Task {
            print("Inicio")
            let image1: UIImage = try await NetworkManagerAsyncThrows.share.request(endPoint: endPoint)
            imageOneView.image = image1
            print("a mimir")
            //            try await Task.sleep(for: .seconds(0.5))
            print("a buscar 2")
            let image2: UIImage = try await NetworkManagerAsyncThrows.share.request(endPoint: endPoint)
            imageTwoView.image = image2
            print("a mimir 2")
            //            try await Task.sleep(for: .seconds(0.5))
            print("a viscar 3")
            let image3: UIImage = try await NetworkManagerAsyncThrows.share.request(endPoint: endPoint)
            imageThreeView.image = image3
            print("encontro")
        }
    }
    
    @objc func makeAConcurrentAcall() {
        Task {
            print("a buscar 1")
            let image1: UIImage = try await NetworkManagerAsyncThrows.share.request(endPoint: endPoint)
            imageOneView.image = image1
            print("a mimir")
//            try await Task.sleep(nanoseconds: 3_000_000_000)
            print("termino 1")
        }
        
        Task {
            print("a buscar 2")
            let image2: UIImage = try await NetworkManagerAsyncThrows.share.request(endPoint: endPoint)
            imageTwoView.image = image2
            print("a mimir 2")
            //            try await Task.sleep(for: .seconds(3))
            print("termino 2")
        }
        
        Task {
            print("a buscar 3")
            let image3: UIImage = try await NetworkManagerAsyncThrows.share.request(endPoint: endPoint)
            imageThreeView.image = image3
            print("a mimir 3")
            //            try await Task.sleep(for: .seconds(3))
            print("termino 3")
        }
    }
    
    @objc func makeAsyncLet() {
        let imagenesUI = [imageOneView, imageTwoView, imageThreeView]
        var count = 0
        Task {
            async let image1: UIImage = NetworkManagerAsyncThrows.share.request(endPoint: endPoint)
            async let image2: UIImage = NetworkManagerAsyncThrows.share.request(endPoint: endPoint)
            async let image3: UIImage = NetworkManagerAsyncThrows.share.request(endPoint: endPoint)
            let photos = try await [image1, image2, image3]
            photos.forEach { image in
                imagenesUI[count].image = image
                count += 1
            }
        }
    }
    
    func buttonGroupConstrains() {
        NSLayoutConstraint.activate([
            serialCallButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            serialCallButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            serialCallButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            serialCallButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func concurrentCallButtonConstrains() {
        NSLayoutConstraint.activate([
            concurrentCallButton.topAnchor.constraint(equalTo: serialCallButton.bottomAnchor, constant: 25),
            concurrentCallButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            concurrentCallButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            concurrentCallButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func callLetAsyncConstrains() {
        NSLayoutConstraint.activate([
            callLetAsync.topAnchor.constraint(equalTo: concurrentCallButton.bottomAnchor, constant: 25),
            callLetAsync.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            callLetAsync.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            callLetAsync.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func imageOneViewConstrains() {
        NSLayoutConstraint.activate([
            imageOneView.topAnchor.constraint(equalTo: callLetAsync.bottomAnchor, constant: 25),
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
    
    func trutnTure() async -> Bool {
        //        try? await Task.sleep(for: .seconds(2))
        return true
    }
    
}

#Preview {
    taskViewController()
}
