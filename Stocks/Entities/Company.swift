//
//  Company.swift
//  Stocks
//
//  Created by Гурген on 20.03.2021.
//

import Foundation

struct Company: Codable {
    let country, currency, exchange, finnhubIndustry: String
        let ipo: String?
        let logo: String
        let marketCapitalization: Int?
        let name: String
        let phone: String?
        let shareOutstanding: Double?
        let ticker: String
        let weburl: String?
}
