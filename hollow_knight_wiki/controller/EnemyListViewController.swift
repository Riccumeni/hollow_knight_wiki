//
//  EnemyListViewController.swift
//  hollow_knight_wiki
//
//  Created by Alessandro Riccumeni on 17/07/23.
//

import UIKit

class EnemyListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = Colors.background
        tableView.backgroundColor = Colors.background
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupUI()
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - COMPONENTS
    
    let searchTextField: UITextField = {
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
    
    let tableView: UITableView = {
        let table = UITableView()
        
        table.register(EnemyTableViewCell.self, forCellReuseIdentifier: EnemyTableViewCell.identifier)
        table.backgroundColor = Colors.background
        table.showsVerticalScrollIndicator = false
        
        return table
    }()
    
    private func setupUI(){
        view.addSubview(searchTextField)
        view.addSubview(tableView)
        
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchTextField.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20)
            
        ])
    }

}

extension EnemyListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EnemyTableViewCell.identifier, for: indexPath) as? EnemyTableViewCell else {
            fatalError("salve")
        }
        
        cell.titleText.text = "ciao [\(indexPath.row)]"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
