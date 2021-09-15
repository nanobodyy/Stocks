//
//  PrimaryMenuTableView.swift
//  Stocks
//
//  Created by Гурген on 07.04.2021.
//

import UIKit

class PrimaryMenuCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let spacing: CGFloat = 20
    
    var menuItem = ["Stocks", "Favourite"]
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = spacing
        layout.sectionInset.right =  spacing
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        super.init(frame: .zero, collectionViewLayout: layout)
        showsHorizontalScrollIndicator = false
        delegate = self
        dataSource = self
        
        register(PrimaryMenuCollectionViewCell.self, forCellWithReuseIdentifier: PrimaryMenuCollectionViewCell.reuseId)
        
        let selectedIndexPath = IndexPath(row: 0, section: 0)
        self.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .bottom)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: PrimaryMenuCollectionViewCell.reuseId, for: indexPath) as! PrimaryMenuCollectionViewCell
        
        let item = menuItem[indexPath.row]
        cell.titleLabel.text = item
        
        return cell
    }
    
}
