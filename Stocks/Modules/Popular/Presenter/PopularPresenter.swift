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
    
    var currentList = [Stocks]()
    var favoriteCompanies = [Stocks]()
    var popularCompanies = [Stocks]()
    
    var menuItem = ["Popular", "Favorite"]
    
    func viewLoad() {
        iteractor?.startFetch()
        view?.startActivityIndictor()
    }
    
    func fillCompany(with company: Stocks, last: Bool) {
        currentList.append(company)
        guard last else {
            sort()
            didFill()
            popularCompanies = currentList
            return
        }
    }
    
    func fillFavoriteCompany(with company: Stocks) {
        favoriteCompanies.append(company)
    }
    
    func didFill() {
        view?.stopActivityIndictor()
        view?.reloadView()
    }
    
    func sort() {
        self.currentList = currentList.sorted { (stock1, stock2) -> Bool in
            (stock1.companyProfile?.ticker)! < (stock2.companyProfile?.ticker)!
        }
    }
    
    func getTicker(for indexPath: IndexPath) -> String {
        guard let ticker = currentList[indexPath.section].companyProfile?.ticker else { return "..."}
        return ticker
    }
    
    func getName(for indexPath: IndexPath) -> String {
        guard let name = currentList[indexPath.section].companyProfile?.name else { return "..."}
        return name
    }
    
    func getPrice(for indexPath: IndexPath) -> Double {
        guard let price = currentList[indexPath.section].qoute?.c else { return 00 }
        return price
    }
    
    func getDayChange(for indexPath: IndexPath) -> Double {
        guard let dayChange = currentList[indexPath.section].qoute?.d else { return 00 }
        return dayChange
    }
    
    func getItemCount() -> Int {
        return currentList.count
    }
    
    func getImageData(for indexPath: IndexPath) -> String {
        guard let logo = currentList[indexPath.section].companyProfile?.logo else { return " " }
        return logo
    }
    
    func isFavorite(for indexPath: IndexPath) -> Bool {
        guard  let ticker = currentList[indexPath.section].companyProfile?.ticker else { return false }
        guard let result = iteractor?.checkedFavorite(from: ticker) else { return false }
        
        return result
    }
    
    func changeIsFavorite(bool: Bool, ticker: String) {
        iteractor?.changeEntity(with: ticker, isFavorite: bool)
    }
    
    func didTapFavoriteMenuItem() {
        for i in currentList {
            guard let ticker = i.companyProfile?.ticker else { return }
            
            if iteractor!.checkedFavorite(from: ticker) {
                favoriteCompanies.append(i)
            }
        }
    }
    
    func changeMenu(index: Int) {
        switch index {
        case 0:
            favoriteCompanies = []
            currentList = popularCompanies
            view?.reloadView()
        case 1:
            didTapFavoriteMenuItem()
            currentList = favoriteCompanies
            view?.reloadView()
        default:
            return
        }
    }
}
