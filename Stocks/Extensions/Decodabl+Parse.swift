//
//  Decodabl+Parse.swift
//  Stocks
//
//  Created by Гурген on 16.09.2021.
//

import Foundation

extension Decodable {
    static func from(_ dictionary: [String: Any]) -> Self? {
      guard let data = try? JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted) else {
        return nil
      }
      return from(data)
    }

    static func from(_ data: Data) -> Self? {
      do {
        return try JSONDecoder().decode(Self.self, from: data)
      } catch {
        print(error)
        return nil
      }
    }
}
