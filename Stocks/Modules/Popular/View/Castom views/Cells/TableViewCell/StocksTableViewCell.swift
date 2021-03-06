//
//  StocksTableViewCell.swift
//  Stocks
//
//  Created by Гурген on 23.03.2021.
//

import UIKit
import Kingfisher

class StocksTableViewCell: UITableViewCell {
    
    static let reuseId = "StockCell"
    
    private var icon: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var tickerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
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
        return label
    }()
    
    private var differenceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGreen
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.layer.cornerRadius = 16
        self.clipsToBounds = false
        self.backgroundColor = .some(UIColor(named: "AccentColor")!)
        self.configureConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func configureConstraint() {
        contentView.addSubview(icon)
        icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        icon.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 52).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 52).isActive = true
        
        contentView.addSubview(tickerLabel)
        tickerLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 12).isActive = true
        tickerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
        
        contentView.addSubview(nameLabel)
        nameLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 12).isActive = true
        nameLabel.topAnchor.constraint(equalTo: tickerLabel.bottomAnchor, constant: 0).isActive = true
        
        contentView.addSubview(favoriteButton)
        favoriteButton.leadingAnchor.constraint(equalTo: tickerLabel.trailingAnchor, constant: 6).isActive = true
        favoriteButton.topAnchor.constraint(equalTo: topAnchor, constant: 17).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: 16).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        contentView.addSubview(priceLabel)
        priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17).isActive = true
        priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
        
        contentView.addSubview(differenceLabel)
        differenceLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 0).isActive = true
        differenceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        
        contentView.heightAnchor.constraint(equalToConstant: 68).isActive = true
    }
    
    func configureUI(with presenter: PopularPresenterProtocol, indexPath: IndexPath) {
        nameLabel.text = presenter.getName(for: indexPath)
        tickerLabel.text = presenter.getTicker(for: indexPath)
        priceLabel.text = "\(presenter.getPrice(for: indexPath))$"
        icon.kf.setImage(with: URL(string: presenter.getImageData(for: indexPath)))

        if presenter.getDayChange(for: indexPath) > 0.0 {
            differenceLabel.text = "$\(presenter.getDayChange(for: indexPath))"
            differenceLabel.textColor = .systemGreen
        } else {
            differenceLabel.text = "$\(presenter.getDayChange(for: indexPath))"
            differenceLabel.textColor = .systemRed
        }
        
    }
    
}
