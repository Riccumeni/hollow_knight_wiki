//
//  PhotoCollectionViewCell.swift
//  hollow_knight_wiki
//
//  Created by Alessandro Riccumeni on 15/07/23.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "GridCell"
    
    var nameText: String = "cavaliere"
    
    public let postText: UILabel = {
        let label = UILabel()
        
        label.text = "cavaliere"
        label.font = UIFont(name: Constants.hollowKnightFont, size: 18)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    private let img: UIImageView = {
        let img = UIImageView()
        
        img.image = UIImage(named: "Knight")
        img.contentMode = .scaleAspectFill
        
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    public func configure(with name: String){
        postText.text = name.lowercased()
        img.image = UIImage(named: name)
    }
    
    private func setupUI(){
        
        self.contentView.addSubview(postText)
        self.contentView.addSubview(img)
        
        postText.translatesAutoresizingMaskIntoConstraints = false
        img.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            img.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            img.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
            img.widthAnchor.constraint(equalToConstant: 50),
            img.heightAnchor.constraint(equalToConstant: 50),
            
            postText.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
            postText.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            postText.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
}
