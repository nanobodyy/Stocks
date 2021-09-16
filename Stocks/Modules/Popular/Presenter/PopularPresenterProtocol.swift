//
//  PopularPresenterProtocol.swift
//  Stocks
//
//  Created by Гурген on 15.09.2021.
//

import Foundation

protocol PopularPresenterProtocol: class {
    func viewLoad()
    func fillData(with company: Company)
    var companies: [Company] { get set }
}
