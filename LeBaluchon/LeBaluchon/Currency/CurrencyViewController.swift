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
    
    
    override func viewDidLoad() {
        currencyView.actionClicked = convert(value:)
        
    }
    
    func convert(value: Float) {
        print(value)
        currencyView.displayResult(value: value * 2)
    }
}
