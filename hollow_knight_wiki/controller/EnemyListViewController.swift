//
//  EnemyListViewController.swift
//  hollow_knight_wiki
//
//  Created by Alessandro Riccumeni on 17/07/23.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseStorage

class EnemyListViewController: UIViewController {
    
    let database = Firestore.firestore()
    let storage = Storage.storage().reference()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var enemies: [Enemy] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let docRef = database.collection("/enemy")
        /*
        docRef.getDocuments{ snapshot, error in
            guard let data = snapshot?.documents, error == nil else {
                return
            }
            
            data.forEach{it in
                self.enemies.append(Enemy(name: it.documentID, url: it.data()["url"] as! String))
                /*
                self.storage.child("\(it.documentID).jpeg").downloadURL(completion: {url, error in
                    guard let url = url, error == nil else {
                        return
                    }
                    
                    let urlString = url.absoluteString
                    self.enemies.append(Enemy(name: it.documentID, url: urlString))
                    // TODO: spostare il ricaricamento della tabell fuori
                    self.tableView.reloadData()
                })
                 */
            }
            self.tableView.reloadData()
        }
         */
        
        view.backgroundColor = Colors.background
        tableView.backgroundColor = Colors.background
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupSearchController()
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
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20)
            
        ])
    }
    
    private func setupSearchController(){
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.placeholder = "Cerca il nemico"
        
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }

}

extension EnemyListViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

extension EnemyListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return enemies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EnemyTableViewCell.identifier, for: indexPath) as? EnemyTableViewCell else {
            fatalError("salve")
        }
        
        cell.titleText.text = enemies[indexPath.row].name
        
        let imageURL = URL(string: enemies[indexPath.row].url)
        cell.img.kf.setImage(with: imageURL)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
