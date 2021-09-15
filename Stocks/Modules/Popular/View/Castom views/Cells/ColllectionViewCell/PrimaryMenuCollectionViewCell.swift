//
//  PrimaryMenuCollectionViewCell.swift
//  Stocks
//
//  Created by Гурген on 07.04.2021.
//

import UIKit

class PrimaryMenuCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "PrimaryMenuCell"
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MuktaMahee-Bold", size: 28)
        label.isEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        configureConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureConstraint() {
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        //titleLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                titleLabel.isEnabled = true
            } else {
                titleLabel.isEnabled = false

            }
        }
    }
}

