//
//  FirstLaunchManager.swift
//  Stocks
//
//  Created by Гурген on 27.09.2021.
//

import Foundation
import CoreData

class LaunchManager {
    
    let dataService = DataService()
    
    private var sp500list = ["AAPL","MSFT","AMZN","FB","JPM","JNJ","GOOGL","NFLX","ORCL","TSLA","INTC","T","V","CSCO","CVX","UNH","PFE","HD","PG","VZ","C","NVDA"]
    
    private let defaults = UserDefaults.standard
    
    func check() {
        if defaults.bool(forKey: "First Launch") == true {
            print("Second+")
            defaults.setValue(true, forKey: "First Launch")
        } else {
            defaults.setValue(true, forKey: "First Launch")
            print("First")
            loadInCoreData()
        }
    }
    
    func loadInCoreData() {
        for ticker in sp500list {
            dataService.addDataBase(ticker: ticker)
        }
    }
}
