//
//  DataService.swift
//  Stocks
//
//  Created by Гурген on 27.09.2021.
//

import UIKit
import CoreData

class DataService {
    
    var tickers: [Entity] = []
    
    func fetchData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
        
        do {
            tickers = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func addDataBase(ticker: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context)
        let taskObject = NSManagedObject(entity: entity!, insertInto: context) as! Entity
        taskObject.ticker = ticker
        //taskObject.isFavorite = false
        
        do {
            try context.save()
            tickers.append(taskObject)
        } catch {
            print(error.localizedDescription)
        }
        
        self.fetchData()
    }
    
    func changeToFavorite(tickerString: String, isFavorite: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "ticker == %@",  tickerString)
        
        do {
            let result = try context.fetch(fetchRequest)
            guard let tickerModel = result.first else { return}
            tickerModel.isFavorite = isFavorite
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        self.fetchData()
    }
    
    func checkToFavorite(from ticker: String) -> Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "ticker == %@",  ticker)
        
        do {
            if let result = try context.fetch(fetchRequest).first {
                return result.isFavorite
            }
        } catch {
            print(error.localizedDescription)
        }
        return false
    }
}
