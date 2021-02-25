//
//  CoinData.swift
//  ByteCoin
//
//  Created by Pedro Neto on 26/08/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let asset_id_quote: String
    let asset_id_base: String
    let rate: Double
}
