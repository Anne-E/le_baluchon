//
//  CurrencyViewController.swift
//  LeBaluchon
//
//  Created by Anne-Elisabeth on 30/09/2019.
//  Copyright © 2019 Anne-Elisabeth. All rights reserved.
//

import Foundation
import UIKit

class CurrencyViewController: UIViewController {
    
    @IBOutlet var currencyView: CurrencyView!

    private var exchangeRate: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyView.actionClicked = convert(value:)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.refreshExchangeRate()
    }
    
    func refreshExchangeRate() {
        CurrencyAPI.shared.getCurrency { (success, result) in
            self.exchangeRate = result
            debugPrint(success)
            debugPrint(result)
        }
    }
    
    func convert(value: Double) {
        self.refreshExchangeRate()
        print(value)
        if let exchangeRate = exchangeRate {
            currencyView.displayResult(value: value * exchangeRate)
        } else {
            currencyView.displayError()
        }
    }
}
