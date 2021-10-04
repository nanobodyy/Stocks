//
//  PopularPresenter.swift
//  Stocks
//
//  Created by Гурген on 15.09.2021.
//

import UIKit
import Kingfisher


class PopularPresenter: PopularPresenterProtocol {
    weak var view: PopularViewControllerProtocol?
    var iteractor: PopularIteractorProtocol?
    
    var companies = [Stocks]()
    var menuItem = ["Popular", "Favorite"]
    
    func viewLoad() {
        iteractor?.startFetch()
        view?.startActivityIndictor()
    }
    
    func fillData(with company: Stocks) {
        companies.append(company)
        self.companies = companies.sorted { (stock1, stock2) -> Bool in
            (stock1.companyProfile?.ticker)! < (stock2.companyProfile?.ticker)!
        }
    }
    
    func didFill() {
        view?.stopActivityIndictor()
        view?.reloadView()
    }
    
    func getTicker(for indexPath: IndexPath) -> String {
        guard let ticker = companies[indexPath.section].companyProfile?.ticker else { return "..."}
        return ticker
    }
    
    func getName(for indexPath: IndexPath) -> String {
        guard let name = companies[indexPath.section].companyProfile?.name else { return "..."}
        return name
    }
    
    func getPrice(for indexPath: IndexPath) -> Double {
        guard let price = companies[indexPath.section].qoute?.c else { return 00 }
        return price
    }
    
    func getDayChange(for indexPath: IndexPath) -> Double {
        guard let dayChange = companies[indexPath.section].qoute?.d else { return 00 }
        return dayChange
    }
    
    func getItemCount() -> Int {
        return companies.count
    }
    
    func getImageData(for indexPath: IndexPath) -> String {
        guard let logo = companies[indexPath.section].companyProfile?.logo else { return " " }
        return logo
    }
    
    func getIsFavorite(for indexPath: IndexPath) -> Bool {
        return companies[indexPath.section].isFavorite ?? false
    }
    
    func changeFavorite(bool: Bool, ticker: String, indexPath: IndexPath) {
        iteractor?.changeEntity(with: ticker, isFavorite: bool)
        
        companies[indexPath.section].isFavorite = bool
    }
    
    
}
