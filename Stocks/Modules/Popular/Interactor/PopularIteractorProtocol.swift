//
//  PopularIteractorProtocol.swift
//  Stocks
//
//  Created by Гурген on 15.09.2021.
//

import Foundation

protocol PopularIteractorProtocol {
    func startFetch()
    func fetchImage(with url: String, complitionHandler: @escaping (Data) -> Void)
}
