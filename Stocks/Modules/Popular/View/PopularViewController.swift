//
//  PopularViewController.swift
//  Stocks
//
//  Created by Гурген on 07.04.2021.
//

import UIKit

class PopularViewController: UIViewController, PopularViewControllerProtocol {
    
    var presenter: PopularPresenter?
    
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
    }
    
    func reloadView() {
        DispatchQueue.main.async {
            self.stockList.reloadData()
        }
    }
}

extension PopularViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StocksTableViewCell.reuseId, for: indexPath) as! StocksTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
}

extension PopularViewController: UITableViewDelegate {
    
}

