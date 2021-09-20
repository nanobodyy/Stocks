//
//  PopularViewController.swift
//  Stocks
//
//  Created by Гурген on 07.04.2021.
//

import UIKit

class PopularViewController: UIViewController, PopularViewControllerProtocol {
    
    var presenter: PopularPresenterProtocol?
   
    private lazy var stockList: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(StocksTableViewCell.self, forCellReuseIdentifier: StocksTableViewCell.reuseId)
        return tableView
    }()
    
    private var menu: UICollectionView = {
        let collectionView = PrimaryMenuCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private func configureConstraint() {
        view.addSubview(menu)
        menu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        menu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        menu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        menu.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        view.addSubview(stockList)
        stockList.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        stockList.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        stockList.topAnchor.constraint(equalTo: menu.bottomAnchor, constant: 8).isActive = true
        stockList.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstraint()
        view.backgroundColor = .white
        presenter?.viewLoad()
    }
    
    func reloadView() {
        DispatchQueue.main.async {
            self.stockList.reloadData()
        }
    }
}

extension PopularViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.companies.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StocksTableViewCell.reuseId, for: indexPath) as! StocksTableViewCell
        
        if indexPath.section % 2 == 0 {
            cell.backgroundColor = .white
        } else {
            cell.backgroundColor = UIColor(red: 241/255, green: 244/255, blue: 247/255, alpha: 1.0)
        }
        
        cell.configureUI(with: presenter!, indexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
}

extension PopularViewController: UITableViewDelegate {
    
}
