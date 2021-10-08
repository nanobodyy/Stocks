//
//  PopularIteractor.swift
//  Stocks
//
//  Created by Гурген on 15.09.2021.
//

import Foundation
import CoreData

class PopularIteractor: PopularIteractorProtocol {
    
    var context: NSManagedObjectContext!
    
    weak var presenter: PopularPresenterProtocol?
    let networkService = NetworkService()
    let dataService = DataService()

    func startFetch() {
        
        dataService.fetchData()
        
        for tickerModel in dataService.tickers {
            
            networkService.response(url: "https://finnhub.io/api/v1/stock/profile2?symbol=\(tickerModel.ticker!)&token=c1a6egv48v6q19j50nt0") { (company: Company?, data, error)  in
                
                var stocks = Stocks(companyProfile: nil, qoute: nil)
                stocks.companyProfile = company
                
                guard let tick = stocks.companyProfile?.ticker else { return }
                
                print(1)
                self.networkService.response(url: "https://finnhub.io/api/v1/quote?symbol=\(tick)&token=c1a6egv48v6q19j50nt0") { (quote: Quote?, data, error)  in
                    
                    stocks.qoute = quote
                    if tickerModel == self.dataService.tickers.last {
                        self.presenter?.fillCompany(with: stocks, last: true)
                    } else {
                        self.presenter?.fillCompany(with: stocks, last: false)
                    }
                }
            }
        }
    }
    
    func changeEntity(with ticker: String, isFavorite: Bool) {
        dataService.changeToFavorite(tickerString: ticker, isFavorite: isFavorite)
    }
    
    func checkedFavorite(from ticker: String) -> Bool {
        var favorite = Bool()
        favorite = dataService.checkToFavorite(from: ticker)
        
        return favorite
    }
}

