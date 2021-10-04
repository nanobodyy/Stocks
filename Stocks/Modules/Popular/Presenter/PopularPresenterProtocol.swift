//
//  PopularPresenterProtocol.swift
//  Stocks
//
//  Created by Гурген on 15.09.2021.
//

import UIKit

protocol PopularPresenterProtocol: class {
    func viewLoad()
    func fillData(with company: Stocks)
    func didFill()
    var companies: [Stocks] { get set }
    var menuItem: [String] { get }
    
    func getTicker(for indexPath: IndexPath) -> String
    func getName(for indexPath: IndexPath) -> String
    func getPrice(for indexPath: IndexPath) -> Double
    func getDayChange(for indexPath: IndexPath) -> Double
    func getItemCount() -> Int
    func getImageData(for indexPath: IndexPath) -> String
    func getIsFavorite(for indexPath: IndexPath) -> Bool
    
    func changeFavorite(bool: Bool, ticker: String, indexPath: IndexPath)
    
}
