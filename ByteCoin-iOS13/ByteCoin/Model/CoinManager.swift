//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdatePrice(_ CoinManager: CoinManager, coin: CoinModel)
    func didFailWithError(error: Error)
}


struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate"
    let apiKey = "EE8AD297-3FF3-4DEA-A56F-A65E7CEBDC4F"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    let coinArray = ["Bitcoin (BTC)", "Ethereum (ETH)", "Ripple (XRP)", "Litecoin (LTC)", "Tether (USDT)","Bitcoin Cash (BCH)", "Libra (LIBRA)", "Monero (XMR)", "EOS (EOS)", "Bitcoin SV (BSV)", "Binance Coin (BNB)"]
    
    let coinInitialsArray = ["BTC","ETH", "XRP", "LTC", "USDT", "BCH", "LIBRA", "XMR", "EO)", "BSV", "BNB"]
    
    var delegate: CoinManagerDelegate?
    
    
    func getCoinPrice(for currency: String, and coin: String) {
        
        let urlString = "\(baseURL)/\(coin)/\(currency)?APIKEY=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let coin = self.parseJSON(safeData) {
                        self.delegate?.didUpdatePrice(self, coin: coin)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let asset_id_quote = decodedData.asset_id_quote
            let rate = decodedData.rate
            let asset_id_base = decodedData.asset_id_base
            
            let coin = CoinModel(currency: asset_id_quote,coinInit: asset_id_base, quote: rate)
            
            return coin
            
        } catch {
            delegate?.didFailWithError(error: error)
            print(error)
            return nil
        }
    }
    
}
