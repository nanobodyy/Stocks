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
    let networkService = CompanyProfileService()
    let dataService = DataService()

    func startFetch() {
        
        dataService.fetchData()
        
        for tickerModel in dataService.tickers {
            
            networkService.response(url: "https://finnhub.io/api/v1/stock/profile2?symbol=\(tickerModel.ticker!)&token=c1a6egv48v6q19j50nt0") { (company: Company?) in
                
                var stocks = Stocks(companyProfile: nil, qoute: nil, isFavorite: tickerModel.isFavorite)
                stocks.companyProfile = company
                
                guard let tick = stocks.companyProfile?.ticker else { return }
                
                print(1)
                self.networkService.response(url: "https://finnhub.io/api/v1/quote?symbol=\(tick)&token=c1a6egv48v6q19j50nt0") { (quote: Quote?) in
                    stocks.qoute = quote
                    
                    self.presenter?.fillCompany(with: stocks)
                    
                    if tickerModel == self.dataService.tickers.last {
                        self.presenter?.didFill()
                        self.presenter?.sort()
                    }
                    
                    if tickerModel.isFavorite == true {
                        self.presenter?.fillFavoriteCompany(with: stocks)
                    }
                }
            }
        }
    }
    
    func fetchImage(with url: String, complitionHandler: @escaping (Data) -> Void) {
        networkService.loadImage(with: url) { (data) in
            complitionHandler(data)
        }
    }
    
    func changeEntity(with ticker: String, isFavorite: Bool) {
        dataService.changeEntity(tickerString: ticker, isFavorite: isFavorite)
    }
}

