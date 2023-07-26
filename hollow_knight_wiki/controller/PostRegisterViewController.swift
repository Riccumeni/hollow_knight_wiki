//
//  PostRegisterViewController.swift
//  hollow_knight_wiki
//
//  Created by Alessandro Riccumeni on 15/07/23.
//

import UIKit

class PostRegisterViewController: UIViewController, UITextViewDelegate {
    
    var profiles = [
        "Cavaliere" ,
        "Hornet",
        "Zote",
        "Cornifer"
    ]
    
    // MARK: - VIEW METHOD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.background
        
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - COMPONENTS
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "scegli un avatar"
        label.font = UIFont(name: Constants.hollowKnightFont, size: 24)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    let profileImage: UIImageView = {
        let image = UIImageView()
        
        image.layer.cornerRadius = 90
        image.layer.borderWidth = 2
        image.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        image.image = UIImage(named: "ChooseImage")
        image.contentMode = .scaleAspectFit
        image.isUserInteractionEnabled = true
        
        return image
    }()
    
    let entomophobiaLabel: UILabel = {
        let label = UILabel()
        
        label.text = "entomofobia"
        label.font = UIFont(name: Constants.hollowKnightFont, size: 18)
        label.textColor = .white
        label.textAlignment = .left
        
        return label
    }()
    
    let entomophobiaInformationButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("clicca per maggiori informazione", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.hollowKnightFont, size: 12)
        
        return button
    }()
    
    let entomophobiaSwitch: UISwitch = {
        let switchItem = UISwitch()
        
        switchItem.isOn = false
        switchItem.backgroundColor = Colors.primary
        switchItem.layer.cornerRadius = 15
        
        return switchItem
    }()
    
    let diaryCompleteLabel: UILabel = {
        let label = UILabel()
        
        label.text = "diario completo"
        label.font = UIFont(name: Constants.hollowKnightFont, size: 18)
        label.textColor = .white
        label.textAlignment = .left
        
        return label
    }()
    
    let diaryCompleteInformationButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("clicca per maggiori informazione", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.hollowKnightFont, size: 12)
        
        return button
    }()
    
    let diaryCompleteSwitch: UISwitch = {
        let switchItem = UISwitch()
        
        switchItem.isOn = false
        switchItem.backgroundColor = Colors.primary
        switchItem.layer.cornerRadius = 15
        
        return switchItem
    }()
    
    let descriptionKnightLabel: UILabel = {
        let label = UILabel()
        
        label.text = "descrizione per gli altri cavalieri (facoltativa)"
        label.font = UIFont(name: Constants.hollowKnightFont, size: 18)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 2
        
        return label
    }()
    
    let descriptionKnightTextField: UITextView = {
        let textField = UITextView()
        textField.text = "scrivi la tua descrizione"
        textField.textColor = UIColor.lightGray
        textField.backgroundColor = Colors.primaryContainer
        textField.font = UIFont(name: "SupernaturalKnight", size: 14)
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = Colors.primary
        button.setTitle("registrati", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.hollowKnightFont, size: 14)
        button.layer.cornerRadius = 5
        button.setTitleColor(.black, for: .highlighted)
        
        return button
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    let contentView: UIView = {
        let cview = UIView()
        
        cview.backgroundColor = Colors.background
        
        return cview
    }()
    
    // MARK: - SETUP UI
    
    private func setupUI(){
        
        if let value = UserDefaults.standard.string(forKey: "profileIndex"){
            profileImage.image = UIImage(named: value)
        }
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(profileImage)
        scrollView.addSubview(entomophobiaLabel)
        scrollView.addSubview(entomophobiaInformationButton)
        scrollView.addSubview(entomophobiaSwitch)
        scrollView.addSubview(diaryCompleteLabel)
        scrollView.addSubview(diaryCompleteSwitch)
        scrollView.addSubview(diaryCompleteInformationButton)
        scrollView.addSubview(descriptionKnightLabel)
        scrollView.addSubview(descriptionKnightTextField)
        scrollView.addSubview(registerButton)
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        entomophobiaLabel.translatesAutoresizingMaskIntoConstraints = false
        entomophobiaSwitch.translatesAutoresizingMaskIntoConstraints = false
        entomophobiaInformationButton.translatesAutoresizingMaskIntoConstraints = false
        diaryCompleteLabel.translatesAutoresizingMaskIntoConstraints = false
        diaryCompleteSwitch.translatesAutoresizingMaskIntoConstraints = false
        diaryCompleteInformationButton.translatesAutoresizingMaskIntoConstraints = false
        descriptionKnightLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionKnightTextField.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionKnightTextField.delegate = self
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(PostRegisterViewController.onProfileImageTapped))
        profileImage.addGestureRecognizer(tapRecognizer)
        
        entomophobiaInformationButton.addTarget(self, action: #selector(onEntomophobiaInformationButtonTapped(sender:)), for: .touchUpInside)
        diaryCompleteInformationButton.addTarget(self, action: #selector(onDiaryCompleteInformationButtonTapped(sender:)), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 70),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            profileImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            profileImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 180),
            profileImage.heightAnchor.constraint(equalToConstant: 180),
            
            entomophobiaLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 40),
            entomophobiaLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            entomophobiaInformationButton.topAnchor.constraint(equalTo: entomophobiaLabel.bottomAnchor, constant: 5),
            entomophobiaInformationButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            entomophobiaSwitch.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 40),
            entomophobiaSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            
            diaryCompleteLabel.topAnchor.constraint(equalTo: entomophobiaInformationButton.bottomAnchor, constant: 20),
            diaryCompleteLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            diaryCompleteInformationButton.topAnchor.constraint(equalTo: diaryCompleteLabel.bottomAnchor, constant: 0),
            diaryCompleteInformationButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            diaryCompleteSwitch.topAnchor.constraint(equalTo: diaryCompleteLabel.bottomAnchor, constant: -20),
            diaryCompleteSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            descriptionKnightLabel.topAnchor.constraint(equalTo: diaryCompleteInformationButton.bottomAnchor, constant: 20),
            descriptionKnightLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionKnightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            descriptionKnightTextField.topAnchor.constraint(equalTo: descriptionKnightLabel.bottomAnchor, constant: 20),
            descriptionKnightTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionKnightTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descriptionKnightTextField.heightAnchor.constraint(equalToConstant: 100),
            
            registerButton.topAnchor.constraint(equalTo: descriptionKnightTextField.bottomAnchor, constant: 40),
            registerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            registerButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
    
    // MARK: - ACTIONS
    
    @objc func onProfileImageTapped(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 130)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 1, right: 20)
        let vc = GridCollectionViewController(collectionViewLayout: layout, parentView: self)
        
        present(vc, animated: true )
    }
    
    @objc func onEntomophobiaInformationButtonTapped(sender: UIButton){
        let alert = UIAlertController(title: "Informazioni Entomofobia", message: "L'entomofobia è la paura alla visione degli insetti. Dato che nell'app saranno presenti immagini riguardanti gli insetti, se si soffre di questa patologia si consiglia di disattivare l'opzione e provvederemo a nascondere la sezione.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func onDiaryCompleteInformationButtonTapped(sender: UIButton){
        let alert = UIAlertController(title: "Informazioni Diario Completo", message: "Nel gioco è presente un diario del cacciatore che si completa man mano che si uccidono i nemici, se non si vuole spoilerare le descrizioni dei nemici, attivare l'opzione", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func descriptionTextViewDidBeginEditing(sender: UITextView){
        descriptionKnightTextField.text = nil
        descriptionKnightTextField.textColor = .white
    }
    
    // MARK: - Delegate
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
                textView.text = nil
                textView.textColor = UIColor.white
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "scrivi la tua descrizione"
            textView.textColor = UIColor.lightGray
        }
    }
}
