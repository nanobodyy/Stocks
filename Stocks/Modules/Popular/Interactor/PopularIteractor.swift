//
//  PopularIteractor.swift
//  Stocks
//
//  Created by Гурген on 15.09.2021.
//

import Foundation

class PopularIteractor: PopularIteractorProtocol {
    
    weak var presenter: PopularPresenterProtocol?
    
    let sp500list = ["AAPL","MSFT","AMZN","FB","JPM","JNJ","GOOGL","XOM","BAC","WFC","INTC","T","V","CSCO","CVX","UNH","PFE","HD","PG","VZ","C","ABBV","BA","KO","CMCSA","MA","PM","DWDP","PEP","ORCL","DIS","MRK","NVDA","MMM","AMGN","IBM","NFLX","WMT"]
    
    func startFetch() {
        
        
        for ticker in sp500list {
            CompanyProfileService.shared.fetchCompanyProfile(ticker: ticker) { (company) in
                self.presenter?.fillData(with: company)
            }
        }
    }
    
    
}
