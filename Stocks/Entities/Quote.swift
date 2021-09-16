//
//  Quote.swift
//  Stocks
//
//  Created by Гурген on 16.09.2021.
//

import Foundation

struct Quote: Codable {
    var c: Double? // current price
    var d: Double? // change
    var dp: Double? // percent change
    var l: Double? 
    var o: Double?
    var pc: Double?
    var t: Double?
}
