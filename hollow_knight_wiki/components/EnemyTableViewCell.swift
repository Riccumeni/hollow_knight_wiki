//
//  EnemyTableViewCell.swift
//  hollow_knight_wiki
//
//  Created by Alessandro Riccumeni on 17/07/23.
//

import UIKit
import Kingfisher

class EnemyTableViewCell: UITableViewCell {

    static let identifier = "enemyCell"
    
    public let titleText: UILabel = {
        let label = UILabel()
        
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont(name: Constants.hollowKnightFont, size: 18)
        label.text = "error"
        
        return label
    }()
    
    public let img: UIImageView = {
        let img = UIImageView()
        
        img.image = UIImage(named: "Hornet")
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    private func setupUI(){
        
        self.backgroundColor = Colors.background
        
        self.contentView.addSubview(titleText)
        self.contentView.addSubview(img)
        
        titleText.translatesAutoresizingMaskIntoConstraints = false
        img.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleText.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            titleText.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            img.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            img.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            img.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            img.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

}
