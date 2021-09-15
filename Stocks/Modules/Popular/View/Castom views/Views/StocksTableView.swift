//
//  StocksCollectionView.swift
//  Stocks
//
//  Created by Гурген on 23.03.2021.
//

import UIKit

class StocksTableView: UITableView {
    
    private let cellSpacingHeight: CGFloat = 8

    init() {
        super.init(frame: .zero, style: .plain)
        delegate = self
        dataSource = self
        register(StocksTableViewCell.self, forCellReuseIdentifier: StocksTableViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        separatorStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension StocksTableView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: StocksTableViewCell.reuseId, for: indexPath) as! StocksTableViewCell
        if indexPath.section % 2 == 0 {
            cell.backgroundColor = .white
        }
        return cell
    }
    
    
}

extension StocksTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
        }
}
