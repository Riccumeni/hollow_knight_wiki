//
//  RegisterViewController.swift
//  hollow_knight_wiki
//
//  Created by Alessandro Riccumeni on 14/07/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let topFrameImage: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(named: "TopFrame")
        
        return image
    }()
    
    let titleLabel: UILabel = {
        let text = UILabel()
        
        text.text = "hollow knight wiki"
        text.font = UIFont(name: Constants.hollowKnightFont, size: 32)
        text.textColor = .white
        text.textAlignment = .center
        
        return text
    }()
    
    let bottomFrameImage: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(named: "BottomFrame")
        
        return image
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = Colors.primaryContainer
        textField.attributedPlaceholder = NSAttributedString(
            string: "username",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "SupernaturalKnight", size: 14)!]
        )
        textField.textColor = .white
        textField.font = UIFont(name: "SupernaturalKnight", size: 14)
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 5
        
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = Colors.primaryContainer
        textField.attributedPlaceholder = NSAttributedString(
            string: "email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "SupernaturalKnight", size: 14)!]
        )
        textField.textColor = .white
        textField.font = UIFont(name: "SupernaturalKnight", size: 14)
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 5
        textField.keyboardType = .emailAddress
        
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = Colors.primaryContainer
        textField.attributedPlaceholder = NSAttributedString(
            string: "password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "SupernaturalKnight", size: 14)!]
        )
        textField.textColor = .white
        textField.font = UIFont(name: "SupernaturalKnight", size: 14)
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 5
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    let repeatPasswordTextField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = Colors.primaryContainer
        textField.attributedPlaceholder = NSAttributedString(
            string: "repeat password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "SupernaturalKnight", size: 14)!]
        )
        textField.textColor = .white
        textField.font = UIFont(name: "SupernaturalKnight", size: 14)
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 5
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = Colors.primary
        button.setTitle("avanti", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.hollowKnightFont, size: 14)
        button.layer.cornerRadius = 5
        button.setTitleColor(.black, for: .highlighted)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = Colors.background
        
        setupUI()
    }
    
    private func setupUI(){
        view.addSubview(topFrameImage)
        view.addSubview(titleLabel)
        view.addSubview(bottomFrameImage)
        view.addSubview(usernameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(repeatPasswordTextField)
        view.addSubview(registerButton)
        
        topFrameImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomFrameImage.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        repeatPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        registerButton.addTarget(self, action: #selector(onRegisterButtonTappedIn(sender:)), for: .touchDown)
        registerButton.addTarget(self, action: #selector(onRegisterButtonTappedOut(sender:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            topFrameImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150),
            topFrameImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            topFrameImage.heightAnchor.constraint(equalToConstant: 20),
            topFrameImage.widthAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: topFrameImage.bottomAnchor, constant: 0),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            bottomFrameImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            bottomFrameImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            bottomFrameImage.heightAnchor.constraint(equalToConstant: 15),
            bottomFrameImage.widthAnchor.constraint(equalToConstant: 150),
            bottomFrameImage.heightAnchor.constraint(equalToConstant: 40),
            
            usernameTextField.topAnchor.constraint(equalTo: bottomFrameImage.bottomAnchor, constant: 40),
            usernameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            emailTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            repeatPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            repeatPasswordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            repeatPasswordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            registerButton.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 40),
            registerButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    @objc func onRegisterButtonTappedIn(sender: UIButton){
        registerButton.backgroundColor = .white
        registerButton.titleLabel?.textColor = Colors.primary
    }
    
    @objc func onRegisterButtonTappedOut(sender: UIButton){
        registerButton.backgroundColor = Colors.primary
        performSegue(withIdentifier: "toRegister2", sender: self)
    }
}
