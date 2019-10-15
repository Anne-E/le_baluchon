//
//  CurrencyView.swift
//  LeBaluchon
//
//  Created by Anne-Elisabeth on 30/09/2019.
//  Copyright © 2019 Anne-Elisabeth. All rights reserved.
//

import Foundation
import UIKit

class CurrencyView : UIView {
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var currencyInput: UILabel!
    
    var actionClicked : ((Double) -> Void)?
    
    override func didMoveToSuperview() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        self.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
    
    @IBAction func convertClicked(_ sender: Any) {
        
        if let value = Double(inputField.text ?? ""),
            let action = actionClicked {
            action(value)
        }
    }
    
    
    public func displayResult(value: Double) {
        resultLabel.text = "\(Double(round(100*value)/100)) $"
    }
    
    public func displayError() {
        resultLabel.text = "Exchange rate not available"
    }
}
