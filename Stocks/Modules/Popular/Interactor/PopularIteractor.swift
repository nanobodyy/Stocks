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
    
    var sp500list = ["AAPL","MSFT","AMZN","FB","JPM","JNJ","GOOGL","XOM","BAC","WFC","INTC","T","V","CSCO","CVX","UNH","PFE","HD","PG","VZ","C","ABBV","BA","KO","CMCSA","MA","PM","DWDP","PEP","ORCL","DIS","MRK","NVDA","MMM","AMGN","IBM","NFLX","WMT"]
    
//    func startFetch() {
//
//        for ticker in sp500list {
//            networkService.response(ticker: ticker) {[weak self] (stocks) in
//                self?.presenter?.fillData(with: stocks)
//                guard let ticker = stocks.companyProfile?.ticker else { return }
//            }
//        }
//    }
    
    func startFetch() {
        //var stocks = Stocks(companyProfile: nil, qoute: nil, isFavorite: false)
        
        for ticker in sp500list {
            networkService.response(url: "https://finnhub.io/api/v1/stock/profile2?symbol=\(ticker)&token=c1a6egv48v6q19j50nt0") { (company: Company?) in
                
                var stocks = Stocks(companyProfile: nil, qoute: nil, isFavorite: false)
                stocks.companyProfile = company
                
                print(1)
                self.networkService.response(url: "https://finnhub.io/api/v1/quote?symbol=\(ticker)&token=c1a6egv48v6q19j50nt0") { (quote: Quote?) in
                    stocks.qoute = quote
                    
                    self.presenter?.fillData(with: stocks)
                }
            }
        }
    }
}

