//
//  PopularIteractor.swift
//  Stocks
//
//  Created by Гурген on 15.09.2021.
//

import Foundation
import Kingfisher

class PopularIteractor: PopularIteractorProtocol {
    
    
    
    weak var presenter: PopularPresenterProtocol?
    let networkService = CompanyProfileService()
    
    var sp500list = ["AAPL","MSFT","AMZN","FB","JPM","JNJ","GOOGL","NFLX","ORCL","C","MA","T","V","CSCO","CVX","UNH","PFE","HD","PG","VZ","C","NVDA"]
    
    func startFetch() {
        
        for ticker in sp500list {
            networkService.response(url: "https://finnhub.io/api/v1/stock/profile2?symbol=\(ticker)&token=c1a6egv48v6q19j50nt0") { (company: Company?) in
                
                var stocks = Stocks(companyProfile: nil, qoute: nil, isFavorite: false)
                stocks.companyProfile = company
                
                guard let tick = stocks.companyProfile?.ticker else { return }
                
                print(1)
                self.networkService.response(url: "https://finnhub.io/api/v1/quote?symbol=\(tick)&token=c1a6egv48v6q19j50nt0") { (quote: Quote?) in
                    stocks.qoute = quote
                    
                    self.presenter?.fillData(with: stocks)
                }
            }
        }
        
    }
    
    func fetchImage(with url: String, complitionHandler: @escaping (Data) -> Void) {
        networkService.loadImage(with: url) { (data) in
            complitionHandler(data)
        }
    }
}

