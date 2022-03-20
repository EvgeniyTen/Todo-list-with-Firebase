//
//  CreateTaskController.swift
//  Todo list with Firebase
//
//  Created by Евгений Тимофеев on 18.03.2022.
//

import UIKit


class CreateTaskController: UIViewController {
    // MARK: - Properties

    private let titleLable: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .black
        label.text = "Create new task item"
        label.textAlignment = .center
        return label
    }()
    
    private let itemTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Create new task"
        textField.font = .systemFont(ofSize: 20)
        textField.textColor = .black
        textField.backgroundColor = .white
//        textField.delegate = self
        return textField
    }()
    
    private lazy var createButton: UIButton = {
        let button = UIButton()
        button.setTitle("Crate new task", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = .systemIndigo
        button.addTarget(self, action: #selector(createNewTaskPressed), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    // MARK: - AppLifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    // MARK: - Selectors

    @objc func createNewTaskPressed() {
//        let taskViewController = CreateTaskController()
//        present(taskViewController, animated: true, completion: nil)
    }
    
    
    // MARK: - Helpers

    func configureUI() {
        
        view.backgroundColor = .white
        view.addSubview(titleLable)
        titleLable.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(itemTextField)
        itemTextField.anchor(top: titleLable.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 128, paddingLeft: 16, paddingRight: 16, height: 40)
        itemTextField.delegate = self
        
        view.addSubview(createButton)
        createButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 16,paddingBottom: 32, paddingRight: 16, height: 50)
    }
    
}

// MARK: - UITextFieldDelegate

extension CreateTaskController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
