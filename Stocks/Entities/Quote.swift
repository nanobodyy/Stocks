//
//  Quote.swift
//  Stocks
//
//  Created by Гурген on 16.09.2021.
//

import Foundation

struct Quote: Codable {
    let c: Double // current price
    let d: Double // change
    let dp: Double // percent change
}
