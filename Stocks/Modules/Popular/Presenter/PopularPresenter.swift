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
    
    var popularCompanies = [Stocks]()
    var favoriteCompanies = [Stocks]()
    var currentList = [Stocks]()
    
    var menuItem = ["Popular", "Favorite"]
    
    func viewLoad() {
        iteractor?.startFetch()
        view?.startActivityIndictor()
    }
    
    func fillCompany(with company: Stocks) {
        popularCompanies.append(company)
    }
    
    func fillFavoriteCompany(with company: Stocks) {
        favoriteCompanies.append(company)
    }
    
    func didFill() {
        view?.stopActivityIndictor()
        view?.reloadView()
    }
    
    func sort() {
        self.popularCompanies = popularCompanies.sorted { (stock1, stock2) -> Bool in
            (stock1.companyProfile?.ticker)! < (stock2.companyProfile?.ticker)!
        }
    }
    
    func getTicker(for indexPath: IndexPath) -> String {
        guard let ticker = popularCompanies[indexPath.section].companyProfile?.ticker else { return "..."}
        return ticker
    }
    
    func getName(for indexPath: IndexPath) -> String {
        guard let name = popularCompanies[indexPath.section].companyProfile?.name else { return "..."}
        return name
    }
    
    func getPrice(for indexPath: IndexPath) -> Double {
        guard let price = popularCompanies[indexPath.section].qoute?.c else { return 00 }
        return price
    }
    
    func getDayChange(for indexPath: IndexPath) -> Double {
        guard let dayChange = popularCompanies[indexPath.section].qoute?.d else { return 00 }
        return dayChange
    }
    
    func getItemCount() -> Int {
        return popularCompanies.count
    }
    
    func getImageData(for indexPath: IndexPath) -> String {
        guard let logo = popularCompanies[indexPath.section].companyProfile?.logo else { return " " }
        return logo
    }
    
    func getIsFavorite(for indexPath: IndexPath) -> Bool {
        return popularCompanies[indexPath.section].isFavorite ?? false
    }
    
    func changeFavorite(bool: Bool, ticker: String, indexPath: IndexPath) {
        iteractor?.changeEntity(with: ticker, isFavorite: bool)
        
        popularCompanies[indexPath.section].isFavorite = bool
    }
    
    func changeMenu(index: Int) {
        switch index {
        case 0:
            popularCompanies = currentList
            view?.reloadView()
        case 1:
            currentList = popularCompanies
            popularCompanies = favoriteCompanies
            view?.reloadView()
        default:
            return
        }
    }
}
