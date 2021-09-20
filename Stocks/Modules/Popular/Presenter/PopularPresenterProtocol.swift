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
    var companies: [Stocks] { get set }
    
    func getTicker(for indexPath: IndexPath) -> String
    func getName(for indexPath: IndexPath) -> String
    func getPrice(for indexPath: IndexPath) -> Double
    func getDayChange(for indexPath: IndexPath) -> Double
    func getItemCount() -> Int
    func getImageData(for indexPath: IndexPath) -> String
}
