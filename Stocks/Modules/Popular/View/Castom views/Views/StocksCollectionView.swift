//
//  StocksCollectionView.swift
//  Stocks
//
//  Created by Гурген on 23.03.2021.
//

import UIKit

class StocksTableView: UITableView {

    init() {
        super.init(frame: .zero, style: .plain)
        delegate = self
        dataSource = self
        register(StocksTableViewCell.self, forCellReuseIdentifier: StocksTableViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension StocksTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: StocksTableViewCell.reuseId, for: indexPath) as! StocksTableViewCell
        
        return cell
    }
    
    
}

extension StocksTableView: UITableViewDelegate {
    
}
