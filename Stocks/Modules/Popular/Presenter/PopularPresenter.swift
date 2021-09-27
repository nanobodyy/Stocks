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
        print(1)
    }
    
    func fillData(with company: Stocks) {
        companies.append(company)
        //print(company)
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
    
    func starDidTap(bool: Bool, ticker: String) {
        iteractor?.changeEntity(with: ticker, isFavorite: bool)
        
        for var i in companies {
            if i.companyProfile?.ticker == ticker {
                i.isFavorite = bool
            }
        }
    }
    
    
}
