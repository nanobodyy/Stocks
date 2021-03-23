//
//  StocksTableViewCell.swift
//  Stocks
//
//  Created by Гурген on 23.03.2021.
//

import UIKit

class StocksTableViewCell: UITableViewCell {
    
    static let reuseId = "StockCell"
    
    private var icon: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 8
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var tickerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "YNDX"
        return label
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Yandex, LLC"
        return label
    }()
    
    private var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Star"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "4500"
        return label
    }()
    
    private var differenceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.text = "+$0.12"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(icon)
        icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        icon.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        icon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 52).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 52).isActive = true

        addSubview(tickerLabel)
        tickerLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 12).isActive = true
        tickerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
        
        addSubview(nameLabel)
        nameLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 12).isActive = true
        nameLabel.topAnchor.constraint(equalTo: tickerLabel.topAnchor, constant: 0).isActive = true
        
        addSubview(favoriteButton)
        favoriteButton.leadingAnchor.constraint(equalTo: tickerLabel.trailingAnchor, constant: 6).isActive = true
        favoriteButton.topAnchor.constraint(equalTo: topAnchor, constant: 17).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: 16).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        addSubview(priceLabel)
        priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 17).isActive = true
        priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
        
        addSubview(differenceLabel)
        differenceLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 0).isActive = true
        differenceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 12).isActive = true
        
        self.widthAnchor.constraint(equalToConstant: 328).isActive = true
        self.heightAnchor.constraint(equalToConstant: 68).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.layer.borderWidth = 1
//        self.backgroundColor = .gray
//        self.layer.masksToBounds = true
//        self.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}