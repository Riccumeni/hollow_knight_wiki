//
//  ViewController.swift
//  hollow_knight_wiki
//
//  Created by Alessandro Riccumeni on 14/07/23.
//

import UIKit

/*
 
 let safeAreaView = UIView()
         safeAreaView.backgroundColor = UIColor.red // Replace with your desired color
         
         view.addSubview(safeAreaView)
         
         // Set autoresizing mask to adjust size with safe area
         safeAreaView.translatesAutoresizingMaskIntoConstraints = false
         safeAreaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
         safeAreaView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
         safeAreaView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
         safeAreaView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
 */

class LoginViewController: UIViewController {
    
    @IBOutlet weak var bottomFrame: UIImageView!
    
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
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        
        textField.backgroundColor = Colors.primaryContainer
        textField.attributedPlaceholder = NSAttributedString(
            string: "password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: Constants.hollowKnightFont, size: 14)!]
        )
        textField.textColor = .white
        textField.font = UIFont(name: Constants.hollowKnightFont, size: 14)
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 5
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = Colors.primary
        button.setTitle("login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.hollowKnightFont, size: 14)
        button.layer.cornerRadius = 5
        button.setTitleColor(.black, for: .highlighted)
        
        return button
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("ho dimenticato la password", for: .normal)
        button.setTitleColor(Colors.primary, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.hollowKnightFont, size: 14)
        button.setTitleColor(.white, for: .highlighted)
        
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("registrati", for: .normal)
        button.setTitleColor(Colors.primary, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.hollowKnightFont, size: 14)
        button.setTitleColor(.white, for: .highlighted)
        
        return button
    }()
    
    let registerLabel: UILabel = {
        let label = UILabel()
        
        label.text = "non sei registrato ?"
        label.font = UIFont(name: Constants.hollowKnightFont, size: 14)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = Colors.background
        
        setupUI()
        
    }
    
    
    private func setupUI(){
        
        self.navigationController?.navigationBar.tintColor = Colors.primary
        
        
        self.view.addSubview(usernameTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
        self.view.addSubview(forgotPasswordButton)
        self.view.addSubview(registerButton)
        self.view.addSubview(registerLabel)
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        registerLabel.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        usernameTextField.addTarget(self, action: #selector(hasChangeText(sender:)), for: .editingChanged)
        loginButton.addTarget(self, action: #selector(loginButtonTappedIn(sender:)), for: .touchDown)
        loginButton.addTarget(self, action: #selector(loginButtonTappedOut(sender:)), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonTapped(sender:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: bottomFrame.bottomAnchor, constant: 40),
            usernameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            usernameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 40),
            
            registerButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40),
            registerButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            registerLabel.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -20),
            registerLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            registerLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
         
    }
    
    // MARK: Actions
    
    @objc func hasChangeText (sender: UITextField){
        usernameTextField.text = usernameTextField.text?.lowercased()
        let pattern = #"^[a-zA-Z0-9\s]+$"#
        if(usernameTextField.text!.range(of: pattern, options: .regularExpression) == nil && !usernameTextField.text!.isEmpty){
            usernameTextField.layer.borderColor = .init(red: 255, green: 0, blue: 0, alpha: 1)
            usernameTextField.layer.borderWidth = 1
        }else{
            usernameTextField.layer.borderWidth = 0
        }
    }
    
    @objc func loginButtonTappedIn(sender: UIButton){
        loginButton.backgroundColor = .white
        loginButton.titleLabel?.textColor = Colors.primary
    }
    
    @objc func loginButtonTappedOut(sender: UIButton){
        loginButton.backgroundColor = Colors.primary
    }
    
    @objc func registerButtonTapped(sender: UIButton){
        performSegue(withIdentifier: "toRegister", sender: self)
    }
    
    
    
    @objc func onRegisterButtonTappedIn(sender: UIButton){
        registerButton.backgroundColor = .white
        registerButton.titleLabel?.textColor = Colors.primary
    }
}
