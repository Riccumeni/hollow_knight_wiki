//
//  PhaseTableViewCell.swift
//  hollow_knight_wiki
//
//  Created by Alessandro Riccumeni on 25/07/23.
//

import UIKit

class AbilityTableViewCell: UITableViewCell {
    
    static let identifier = "abilityCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = Colors.background
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = Colors.background
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "fase"
        label.font = UIFont(name: Constants.hollowKnightFont, size: 34)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    public func updateLabel(title: String){
        titleLabel.text = title
    }
    
    private func setupUI(){
 
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        let layout = [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ]
        
        
        NSLayoutConstraint.activate(layout)
    }

}

