//
//  fistViewController.swift
//  geneciNetworkManager
//
//  Created by Emmanuel Zambrano Quitian on 9/14/23.
//

import UIKit

struct dataFomr: Decodable {
    let id: Int
    let value: String
    let secondValue: String
    let thirdValue: String
    let fourthValue: String
}

class fistViewController: UIViewController, seUpViewProtocol {
    
    //MARK: - View componets
    
    var taskOne: Task<(), Error>? = nil
    var taskTwo: Task<(), Error>? = nil

    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Set value"
        label.backgroundColor = .systemGray6
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var bankButton: UIButton = {
        let button = UIButton()
        button.setTitle("go To bank", for: .normal)
        button.addTarget(self, action: #selector(gotoBankView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var mainButton: UIButton = {
        let button = UIButton()
        button.setTitle("Call with custom responce", for: .normal)
        button.addTarget(self, action: #selector(makeCallWithCustomResult), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var textButton: UIButton = {
        let button = UIButton()
        button.setTitle("make a Call With Result", for: .normal)
        button.addTarget(self, action: #selector(makeCallWithResult), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var makeCallAsyncAwait: UIButton = {
        let button = UIButton()
        button.setTitle("make a Call With Async Await", for: .normal)
        button.addTarget(self, action: #selector(makeCallWithAsyncAwait), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .purple
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var makCallAsynThrows: UIButton = {
        let button = UIButton()
        button.setTitle("Make a call Asyn That throws", for: .normal)
        button.addTarget(self, action: #selector(makeCallWithAsyncThrows), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var makCallAsynReturInMainActor: UIButton = {
        let button = UIButton()
        button.setTitle("Make a call return in Main Actor", for: .normal)
        button.addTarget(self, action: #selector(makeCallAsyncReturInMain), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBrown
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var cleanTexto: UIButton = {
        let button = UIButton()
        button.setTitle("celan Texto", for: .normal)
        button.addTarget(self, action: #selector(cleantexto), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var gotToView2: UIButton = {
        let button = UIButton()
        button.setTitle("go to GDC", for: .normal)
        button.addTarget(self, action: #selector(goToGDCView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var gotoViewTask: UIButton = {
        let button = UIButton()
        button.setTitle("go to View task", for: .normal)
        button.addTarget(self, action: #selector(gotoViewTaskcation), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 25
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupView()
    }
    
    //MARK: - Hierarchy
    
    func viewComponets() {
        view.addSubview(textLabel)
        view.addSubview(bankButton)
        view.addSubview(mainButton)
        view.addSubview(textButton)
        view.addSubview(makeCallAsyncAwait)
        view.addSubview(makCallAsynThrows)
        view.addSubview(makCallAsynReturInMainActor)
        view.addSubview(cleanTexto)
        view.addSubview(gotToView2)
        view.addSubview(gotoViewTask)
    }
    
    func viewConstrains() {
        textLableConstrains()
        bankButtonConstrains()
        mainButtonConstrains()
        textButtonConstrains()
        makeCallAsyncAwaitConstrains()
        makCallAsynThrowsConstrains()
        makCallAsynReturInMainActorConstrains()
        cleanTextoConstrains()
        gotToView2Constrains()
        gotoViewTaskConstrains()
    }
    
    //MARK: - view Actions
    
    @objc func makeCallWithCustomResult() {
        let completion: (networkResponse<dataFomr>) -> () = { [weak self] result in
            switch result {
            case .success(dataResponse: let dataFomr):
                print(dataFomr.id)
                self?.settextLableText("\(dataFomr.id)")
            case .failure(error: let error):
                print(error)
                self?.settextLableText(error.localizedDescription)
            case .notConnectedToInternet:
                print("no internet")
            }
        }
        NetworManagerCompletionHandler.share.request(endPoint: "https://d2e71.wiremockapi.cloud/json/1", methods: .GET, completion: completion)
    }
    
    @objc func makeCallWithResult() {
        let completion: (Result<dataFomr, Error>) -> () = { [weak self] result in
            switch result {
            case .success(data: let dataFomr):
                print(dataFomr.value)
                self?.settextLableText(dataFomr.value)
            case .failure(error: let error):
                self?.settextLableText(error.localizedDescription)
                print(error)
            }
        }
        NetworkManagerCompletionResult.share.request(endPoint: "https://d2e71.wiremockapi.cloud/json/1", methods: .GET, completion: completion)
    }
    
    @objc func makeCallWithAsyncAwait() {
        Task {
            let value: Result<dataFomr, Error>  = await NetworkManagerAsync.share.request(endPoint: "https://d2e71.wiremockapi.cloud/json/1", methods: .GET)
            switch value {
                
            case .success(let data):
                print(data.secondValue)
                settextLableText(data.secondValue)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc func makeCallWithAsyncThrows() {
        taskOne = Task {
            print("entro 1")
//            try? await Task.sleep(for: .seconds(5))
            var name = String()
            do {
                let value: dataFomr = try await NetworkManagerAsyncThrows.share.request(endPoint: "https://d2e71.wiremockapi.cloud/json/1", methods: .GET)
                name = value.thirdValue
            } catch {
                print(error)
            }
            do { try Task.checkCancellation() } catch { print(error) }
//            print("termino el llamdo")
//            try? await Task.sleep(for: .seconds(3))
//            print("otroes 3 segundos")
            await settextLableTextActor(name)
        }
    }
    
    @objc func makeCallAsyncReturInMain() { //TODO: fix this func
        taskOne?.cancel()
        taskTwo = Task {
            do {
                let value: dataFomr = try await NetworkManagerAsyncThrows.share.requestMain(endPoint: "https://d2e71.wiremockapi.cloud/json/1", methods: .GET)
                self.textLabel.text = value.fourthValue
            } catch {
                print(error)
            }
        }
    }
    
    @objc func cleantexto() {
        textLabel.text = String()
    }
    
    @objc func goToGDCView() {
        let GDCView = GDCViewRouter.getGDCView()
        self.navigationController?.pushViewController(GDCView, animated: true)
    }
    
    @objc func gotoViewTaskcation() {
        let taskView = taskRouter.getTaskView()
        navigationController?.pushViewController(taskView, animated: true)
    }
    
    @objc func gotoBankView() {
        let bankView = bankRouter.getBank()
        navigationController?.pushViewController(bankView, animated: true)
    }
    
    private func settextLableText(_ text: String) {
        let queue = DispatchQueue.main
        queue.async {
            self.textLabel.text = text
        }
    }
    
    private func settextLableTextActor(_ text: String) async {
        await MainActor.run {
            self.textLabel.text = text
        }
    }
    
    //MARK: - view Constrains
    
    private func textLableConstrains() {
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            textLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func bankButtonConstrains() {
        NSLayoutConstraint.activate([
            bankButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 25),
            bankButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            bankButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            bankButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func mainButtonConstrains() {
        NSLayoutConstraint.activate([
            mainButton.topAnchor.constraint(equalTo: bankButton.bottomAnchor, constant: 25),
            mainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            mainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            mainButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func textButtonConstrains() {
        NSLayoutConstraint.activate([
            textButton.topAnchor.constraint(equalTo: mainButton.bottomAnchor, constant: 25),
            textButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            textButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            textButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func makeCallAsyncAwaitConstrains() {
        NSLayoutConstraint.activate([
            makeCallAsyncAwait.topAnchor.constraint(equalTo: textButton.bottomAnchor, constant: 25),
            makeCallAsyncAwait.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            makeCallAsyncAwait.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            makeCallAsyncAwait.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func makCallAsynThrowsConstrains() {
        NSLayoutConstraint.activate([
            makCallAsynThrows.topAnchor.constraint(equalTo: makeCallAsyncAwait.bottomAnchor, constant: 25),
            makCallAsynThrows.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            makCallAsynThrows.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            makCallAsynThrows.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func makCallAsynReturInMainActorConstrains() {
        NSLayoutConstraint.activate([
            makCallAsynReturInMainActor.topAnchor.constraint(equalTo: makCallAsynThrows.bottomAnchor, constant: 25),
            makCallAsynReturInMainActor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            makCallAsynReturInMainActor.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            makCallAsynReturInMainActor.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func cleanTextoConstrains() {
        NSLayoutConstraint.activate([
            cleanTexto.topAnchor.constraint(equalTo: makCallAsynReturInMainActor.bottomAnchor, constant: 25),
            cleanTexto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            cleanTexto.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            cleanTexto.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func gotToView2Constrains() {
        NSLayoutConstraint.activate([
            gotToView2.topAnchor.constraint(equalTo: cleanTexto.bottomAnchor, constant: 25),
            gotToView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            gotToView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            gotToView2.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func gotoViewTaskConstrains() {
        NSLayoutConstraint.activate([
            gotoViewTask.topAnchor.constraint(equalTo: gotToView2.bottomAnchor, constant: 25),
            gotoViewTask.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            gotoViewTask.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            gotoViewTask.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

#Preview {
    fistViewController()
}
