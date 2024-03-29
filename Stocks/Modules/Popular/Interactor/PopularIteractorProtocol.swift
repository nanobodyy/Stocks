//
//  PopularIteractorProtocol.swift
//  Stocks
//
//  Created by Гурген on 15.09.2021.
//

import Foundation

protocol PopularIteractorProtocol {
    func startFetch()
    func changeEntity(with ticker: String, isFavorite: Bool)
    func checkedFavorite(from ticker: String) -> Bool
}
