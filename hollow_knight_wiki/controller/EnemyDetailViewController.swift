//
//  EnemyDetailViewController.swift
//  hollow_knight_wiki
//
//  Created by Alessandro Riccumeni on 18/07/23.
//

import UIKit

class EnemyDetailViewController: UIViewController {
    
    var enemy: Enemy =
    Enemy(
        name: "Vorino",
        url: "",
        phases: [
            Phase(
                name: "fase 1",
                abilities: [
                    Ability(title: "camminata", description: "Continuano a camminare avanti e indietro senza prendere di mira Il Cavaliere. Non possono nemmeno scalare muri o soffitti.")
                ]
            ),
            Phase(
                name: "fase 2",
                abilities: [
                    Ability(title: "camminata", description: "Continuano a camminare avanti e indietro senza prendere di mira Il Cavaliere. Non possono nemmeno scalare muri o soffitti."),
                    Ability(title: "corsa", description: "Continuano a correre avanti e indietro prendendo di mira Il Cavaliere. Non possono nemmeno scalare muri o soffitti.")
                ]
            ),
        ]
    )
    
    let spoiler = true
    
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
    
    let profileImageView: UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Vorino"
        label.font = UIFont(name: Constants.hollowKnightFont, size: 34)
        label.textColor = .white
        
        return label
    }()
    
    let topFrameImage: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(named: "TopFrameHunter")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Timido mangiacarogne che vaga per le caverne alla ricerca di cibo."
        label.font = UIFont(name: Constants.hollowKnightFont, size: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 5
        
        return label
    }()
    
    let divider: UIView = {
        let divider = UIView()
        
        divider.backgroundColor = .white
        
        return divider
    }()
    
    let fullDescriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Inutile e patetico. Non vale quasi la pena di ucciderlo."
        label.font = UIFont(name: Constants.hollowKnightFont, size: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 5
        
        return label
    }()
    
    let bottomFrameImage: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(named: "BottomFrame")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    
    
    let sectionTitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "comportamento e tattiche"
        label.font = UIFont(name: Constants.hollowKnightFont, size: 28)
        label.textColor = .white
        label.numberOfLines = 3
        label.textAlignment = .center
        
        return label
    }()
    
    let phaseTableView: UITableView = {
        let table = UITableView()
        
        table.register(PhaseTableViewCell.self, forCellReuseIdentifier: PhaseTableViewCell.identifier)
        table.allowsSelection = false
        
        return table
    }()
    
    let abilitiesStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Colors.background
        phaseTableView.dataSource = self
        phaseTableView.delegate = self
        phaseTableView.backgroundColor = Colors.background
        
        setupUI()
    }
    
    private func setupAbilitiesStackView(){
        enemy.phases.forEach{ phase in
            if(enemy.phases.count > 1){
                let titlePhase = UILabel()
                titlePhase.text = phase.name
                titlePhase.font = UIFont(name: Constants.hollowKnightFont, size: 34)
                titlePhase.textColor = .white
                titlePhase.textAlignment = .center
                abilitiesStackView.addArrangedSubview(titlePhase)
            }
            
            phase.abilities.forEach{ ability in
                let abilityLb = UILabel()
                abilityLb.text = ability.title
                abilityLb.font = UIFont(name: Constants.hollowKnightFont, size: 24)
                abilityLb.textColor = .white
                abilityLb.textAlignment = .center
                
                let abilityDescriptionLb = UILabel()
                abilityDescriptionLb.text = ability.description
                abilityDescriptionLb.font = UIFont(name: Constants.hollowKnightFont, size: 14)
                abilityDescriptionLb.textColor = .white
                abilityDescriptionLb.textAlignment = .center
                abilityDescriptionLb.numberOfLines = 10
                
                abilitiesStackView.addArrangedSubview(abilityLb)
                abilitiesStackView.addArrangedSubview(abilityDescriptionLb)
            }
            
        }
    }
    
    private func setupUI(){
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        scrollView.addSubview(profileImageView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(topFrameImage)
        scrollView.addSubview(descriptionLabel)
        spoiler ? scrollView.addSubview(fullDescriptionLabel) : nil
        scrollView.addSubview(bottomFrameImage)
        scrollView.addSubview(divider)
        scrollView.addSubview(sectionTitleLabel)
        // scrollView.addSubview(phaseTableView)
        scrollView.addSubview(abilitiesStackView)
        
        setupAbilitiesStackView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        topFrameImage.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        fullDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomFrameImage.translatesAutoresizingMaskIntoConstraints = false
        divider.translatesAutoresizingMaskIntoConstraints = false
        sectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        // phaseTableView.translatesAutoresizingMaskIntoConstraints = false
        abilitiesStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // phaseTableView.isScrollEnabled = false
        
        let imageURL = URL(string: "https://firebasestorage.googleapis.com/v0/b/hollowknight-64c47.appspot.com/o/vorino.jpeg?alt=media&token=97d18c35-f8ae-418a-b170-5fa94faa2ee0")
        profileImageView.kf.setImage(with: imageURL)
        
        let fullDescConstraint = spoiler ? [
            divider.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            divider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            divider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            divider.heightAnchor.constraint(equalToConstant: 1),
            
            fullDescriptionLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 20),
            fullDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            fullDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            fullDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        ] : nil
        
        var layout = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            profileImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 150),
            
            titleLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            topFrameImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            topFrameImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            topFrameImage.widthAnchor.constraint(equalToConstant: 240),
            
            descriptionLabel.topAnchor.constraint(equalTo: topFrameImage.bottomAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            bottomFrameImage.topAnchor.constraint(equalTo: spoiler ? fullDescriptionLabel.bottomAnchor : descriptionLabel.bottomAnchor, constant: 20),
            bottomFrameImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bottomFrameImage.widthAnchor.constraint(equalToConstant: 180),
            
            sectionTitleLabel.topAnchor.constraint(equalTo: bottomFrameImage.bottomAnchor, constant: 40),
            sectionTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            sectionTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            abilitiesStackView.topAnchor.constraint(equalTo: sectionTitleLabel.bottomAnchor, constant: 20),
            abilitiesStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            abilitiesStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            abilitiesStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            
            // phaseTableView.topAnchor.constraint(equalTo: sectionTitleLabel.bottomAnchor, constant: 20),
            // phaseTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            // phaseTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            // phaseTableView.heightAnchor.constraint(equalToConstant: 400),
            // phaseTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ]
        
        if (fullDescConstraint != nil){
            fullDescConstraint?.forEach{item in
                layout.append(item)
            }
        }
            
        NSLayoutConstraint.activate(layout)
    }

}

extension EnemyDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhaseTableViewCell.identifier, for: indexPath) as? PhaseTableViewCell else {
            fatalError("salve")
        }
        
        cell.updateFields(title: "fase 1")
        
        return cell
    }
    
    
}
