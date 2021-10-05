//
//  PopularPresenterProtocol.swift
//  Stocks
//
//  Created by Гурген on 15.09.2021.
//

import UIKit

protocol PopularPresenterProtocol: class {
    func viewLoad()
    func  fillCompany(with company: Stocks, last: Bool)
    func fillFavoriteCompany(with company: Stocks)
    func didFill()
    func sort()

    var menuItem: [String] { get }
    func getTicker(for indexPath: IndexPath) -> String
    func getName(for indexPath: IndexPath) -> String
    func getPrice(for indexPath: IndexPath) -> Double
    func getDayChange(for indexPath: IndexPath) -> Double
    func getItemCount() -> Int
    func getImageData(for indexPath: IndexPath) -> String
    func isFavorite(for indexPath: IndexPath) -> Bool
    
    func changeIsFavorite(bool: Bool, ticker: String)
    func changeMenu(index: Int)
}

