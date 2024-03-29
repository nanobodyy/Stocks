//
//  StocksTableViewCell.swift
//  Stocks
//
//  Created by Гурген on 23.03.2021.
//

import UIKit
import Kingfisher

protocol TapFavoriteProtocol {
    func didTap(bool: Bool, name: String)
}

class StocksTableViewCell: UITableViewCell {

    static let reuseId = "StockCell"
    var delegate: TapFavoriteProtocol?
    var isFavorite: Bool?
    var indexPath: IndexPath?
    
    private var icon: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var tickerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy  var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var differenceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 12)
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
    
    
    func configureUI(with presenter: PopularPresenterProtocol) {
        guard let indexPath = indexPath else { return }
        
        nameLabel.text = presenter.getName(for: indexPath)
        tickerLabel.text = presenter.getTicker(for: indexPath)
        priceLabel.text = "\(presenter.getPrice(for: indexPath))$"
        buttonSelected(bool: presenter.isFavorite(for: indexPath))
        isFavorite = presenter.isFavorite(for: indexPath)
        icon.kf.setImage(with: URL(string: presenter.getImageData(for: indexPath)))
        

        if presenter.getDayChange(for: indexPath) > 0.0 {
            differenceLabel.text = "$\(presenter.getDayChange(for: indexPath))"
            differenceLabel.textColor = UIColor(red: 86/255, green: 176/255, blue: 102/255, alpha: 1)
        } else {
            differenceLabel.text = "$\(presenter.getDayChange(for: indexPath))"
            differenceLabel.textColor = UIColor(red: 163/255, green: 50/255, blue: 44/255, alpha: 1)
        }
        
    }
    
    @objc func buttonAction() {
        if isSelected {
            buttonSelected(bool: !isSelected)
            isSelected = !isSelected
            
            delegate?.didTap(bool: false, name: tickerLabel.text!)
        } else {
            buttonSelected(bool: !isSelected)
            isSelected = !isSelected
            
            delegate?.didTap(bool: true, name: tickerLabel.text!)
        }
    }
    
    func buttonSelected(bool: Bool) {
        if bool {
            favoriteButton.setImage(UIImage(named: "Selected"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(named: "Star"), for: .normal)
        }
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
}
