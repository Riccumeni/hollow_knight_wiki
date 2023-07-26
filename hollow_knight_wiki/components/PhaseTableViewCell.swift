//
//  PhaseTableViewCell.swift
//  hollow_knight_wiki
//
//  Created by Alessandro Riccumeni on 25/07/23.
//

import UIKit

class PhaseTableViewCell: UITableViewCell {
    
    static let identifier = "phaseCell"
    
    var phase: Phase?

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
    
    let abilityLabel: UILabel = {
        let label = UILabel()
        
        label.text = "fase"
        label.font = UIFont(name: Constants.hollowKnightFont, size: 24)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    let abilitiesStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        
        return stack
    }()
    
    
    public func updateFields(title: String){
        titleLabel.text = title
    }
    
    func addAbilityToStackView(){
        let numberOfAbility = 5
        
        for i in 0...numberOfAbility{
            let abilityLb = UILabel()
            abilityLb.text = "ability \(i)"
            abilityLb.font = UIFont(name: Constants.hollowKnightFont, size: 24)
            abilityLb.textColor = .white
            abilityLb.textAlignment = .center
            abilitiesStackView.addArrangedSubview(abilityLb)
        }
    }
    
    private func setupUI(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(abilitiesStackView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        abilitiesStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        addAbilityToStackView()
        
        let titleLabelConstraint = [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        
        var layout = [
            abilitiesStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            abilitiesStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            abilitiesStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            abilitiesStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ]
        
        
        titleLabelConstraint.forEach{ item in
            layout.append(item)
        }
         
        
        NSLayoutConstraint.activate(layout)
    }

}
