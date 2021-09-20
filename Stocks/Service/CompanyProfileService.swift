//
//  CompanyProfileService.swift
//  Stocks
//
//  Created by Гурген on 20.03.2021.
//

import UIKit

class CompanyProfileService {
    
    func response<T: Codable>(url:String, complitionHandler:@escaping (T?) -> Void) {
        guard let url = URL(string: url) else { return }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            //print(String(describing: repsonse))
            complitionHandler(self.parse(with: data))
        }
        task.resume()
    }
    
    func parse<T: Codable>(with data: Data) -> T? {
        let decoder = JSONDecoder()
        
        do {
            let model = try decoder.decode(T.self, from: data)
            return model
        } catch let error as NSError {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func loadImage(with url: String, complitionHandler:@escaping (Data) -> Void) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            //guard let image = UIImage(data: data) else { return }
            complitionHandler(data)
        }
        session.resume()
    }
}
