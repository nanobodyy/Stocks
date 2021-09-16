//
//  CompanyProfileService.swift
//  Stocks
//
//  Created by Гурген on 20.03.2021.
//

import Foundation

class CompanyProfileService {
    
    static let shared = CompanyProfileService()
    
    private init() { }
    
    func response<T:Codable>(ticker: String, complitionHandler: @escaping (T) -> Void) {
        guard let url = URL(string: "https://finnhub.io/api/v1/stock/profile2?symbol=\(ticker)&token=c1a6egv48v6q19j50nt0") else { return }
        
        let requst = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: requst) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            if let company = T.from(data) {
                complitionHandler(company)
            }
        }
        task.resume()
    }
    
    func fetchCurrentPrice(ticker: String) {
        guard let url = URL(string: "https://finnhub.io/api/v1/quote?symbol=\(ticker)&token=\(apiKey)") else { return}
        
    }
    
//    func parseJSON<T:Codable>(withData data: Data) -> T? {
//        let decoder = JSONDecoder()
//
//        do {
//            let company = try decoder.decode(Company.self, from: data)
//            return company
//        } catch let error as NSError {
//            print(error.localizedDescription)
//        }
//
//        return nil
//    }
}
