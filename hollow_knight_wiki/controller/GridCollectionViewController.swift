//
//  GridCollectionViewController.swift
//  hollow_knight_wiki
//
//  Created by Alessandro Riccumeni on 15/07/23.
//

import UIKit

private let reuseIdentifier = "GridCell"

class GridCollectionViewController: UICollectionViewController {
    
    var parentView: PostRegisterViewController?
    
    init(collectionViewLayout layout: UICollectionViewLayout, parentView parent: PostRegisterViewController) {
        super.init(collectionViewLayout: layout)
        
        parentView = parent
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    var profiles = [
        "Cavaliere" ,
        "Hornet" ,
        "Zote" ,
        "Cornifer"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView.backgroundColor = Colors.background
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return profiles.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else {
            fatalError("salve")
        }
    
        // Configure the cell
        
        cell.configure(with: profiles[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UserDefaults.standard.set(profiles[indexPath.row], forKey: "profileIndex")
        UserDefaults.standard.synchronize()
        
        parentView?.profileImage.image = UIImage(named: profiles[indexPath.row])
    }
    
}
