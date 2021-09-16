//
//  PopularIteractor.swift
//  Stocks
//
//  Created by Гурген on 15.09.2021.
//

import Foundation

class PopularIteractor: PopularIteractorProtocol {
    
    weak var presenter: PopularPresenterProtocol?
    let networkService = CompanyProfileService()
    
    var sp500list = ["AAPL","MSFT","AMZN","FB","JPM","JNJ","GOOGL","XOM","BAC","WFC","INTC","T","V","CSCO","CVX","UNH","PFE","HD","PG","VZ","C","ABBV","BA","KO","CMCSA","MA","PM","DWDP","PEP","ORCL","DIS","MRK","NVDA","MMM","AMGN","IBM","NFLX","WMT"]
    
    func startFetch() {
        
        for ticker in sp500list {
            networkService.response(ticker: ticker) {[weak self] (stocks) in
                self?.presenter?.fillData(with: stocks)
                guard let ticker = stocks.companyProfile?.ticker else { return }
            }
        }
    }
}
