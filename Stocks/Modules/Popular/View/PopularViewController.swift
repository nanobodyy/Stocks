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
    
    let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    let menu = MenuStack()
    
    
    private func configureConstraint() {
        view.addSubview(menu)
        menu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        menu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        menu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        menu.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        view.addSubview(stockList)
        stockList.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        stockList.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        stockList.topAnchor.constraint(equalTo: menu.bottomAnchor, constant: -8).isActive = true
        stockList.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        indicator.center = self.view.center
        view.addSubview(indicator)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstraint()
        view.backgroundColor = .white
        presenter?.viewLoad()
        menu.configure(with: presenter!.menuItem)
    }
    
    func reloadView() {
        DispatchQueue.main.async {
            self.stockList.reloadData()
            self.indicator.stopAnimating()
        }
    }
    
    func startActivityIndictor() {
        indicator.startAnimating()
    }
    
    func stopActivityIndictor() {
        DispatchQueue.main.async {
            self.indicator.stopAnimating()
        }
    }
}

extension PopularViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.getItemCount() ?? 0
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
        
        cell.delegate = self
        cell.indexPath = indexPath
        cell.configureUI(with: presenter!)
        cell.selectionStyle = .none
        
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

extension PopularViewController: TapFavoriteProtocol {
    func didTap(bool: Bool, name: String, indexPath: IndexPath) {
        presenter?.changeFavorite(bool: bool, ticker: name, indexPath: indexPath)
    }
}
