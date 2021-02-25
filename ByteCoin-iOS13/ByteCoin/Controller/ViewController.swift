//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var coinLabel: UILabel!
    
    var currencyPicker = UIPickerView()
    var coinPicker = UIPickerView()
    
    @IBOutlet weak var coinTextField: UITextField!
    @IBOutlet weak var currencyTextField: UITextField!
    
    var coinManager = CoinManager()
    
    var selectedCurrency: String = "AUD"
    var selectedCoin: String = "BTC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        coinPicker.dataSource = self
        coinPicker.delegate = self
        
        coinTextField.inputView = coinPicker
        currencyTextField.inputView = currencyPicker
    }
    
    @IBAction func getQuotationPressed(_ sender: UIButton) {
        coinManager.getCoinPrice(for: selectedCurrency, and: selectedCoin)
    }
    
}

//MARK: - CoinManagerDelegate
extension ViewController: CoinManagerDelegate {
    
    func didUpdatePrice(_ coinManager: CoinManager, coin: CoinModel) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = NumberFormatter.localizedString(from: NSNumber(value: coin.quote), number: .currency)
            self.currencyLabel.text = coin.currency
            self.coinLabel.text = coin.coinInit
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}

//MARK: - UIPickerViewDataSource, UIPickerViewDelegate
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == currencyPicker) {
            return coinManager.currencyArray.count
        }
        if (pickerView == coinPicker) {
            return coinManager.coinArray.count
        } else {
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == currencyPicker) {
            return coinManager.currencyArray[row]
        }
        if (pickerView == coinPicker) {
            return coinManager.coinArray[row]
        } else {
            return nil
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == currencyPicker) {
            selectedCurrency = coinManager.currencyArray[row]
            currencyTextField.text = coinManager.currencyArray[row]
            currencyTextField.resignFirstResponder()
        }
        if (pickerView == coinPicker) {
            coinTextField.text = coinManager.coinInitialsArray[row]
            coinTextField.resignFirstResponder()
            selectedCoin = coinManager.coinInitialsArray[row]
        }
    }
    
}

