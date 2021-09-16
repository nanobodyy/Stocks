//
//  CompanyProfileService.swift
//  Stocks
//
//  Created by Гурген on 20.03.2021.
//

import Foundation

class CompanyProfileService {

    
    func response(ticker: String, complitionHandler: @escaping (Stocks) -> Void) {
        guard let url = URL(string: "https://finnhub.io/api/v1/stock/profile2?symbol=\(ticker)&token=c1a6egv48v6q19j50nt0") else { return }
        
        let requst = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: requst) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            if let company = self.parseJSON(withData: data) {
                
                var stocks = Stocks(companyProfile: company, qoute: nil, isFavorite: false)
                //complitionHandler(company)
                self.fetchPrice(ticker: company.ticker!) { (qoute) in
                    stocks.qoute = qoute
                    complitionHandler(stocks)
                }
            }
        }
        task.resume()
    }
    
    
    func parseJSON(withData data: Data) -> Company? {
        let decoder = JSONDecoder()

        do {
            let company = try decoder.decode(Company.self, from: data)
            return company
        } catch let error as NSError {
            print(error.localizedDescription)
        }

        return nil
    }
    
    func fetchPrice(ticker: String, complition: @escaping (Quote) -> Void) {
        guard let url = URL(string: "https://finnhub.io/api/v1/quote?symbol=\(ticker)&token=c1a6egv48v6q19j50nt0") else { return }
        
        let requst = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: requst) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            if let price = self.parsePrice(withData: data) {
                complition(price)
            }
        }
        task.resume()
    }
    
    func parsePrice(withData data: Data) -> Quote? {
        let decoder = JSONDecoder()
        
        do {
            let price = try decoder.decode(Quote.self, from: data)
            return price
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
