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
    
    @IBOutlet weak var inputField: CurrencyField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var currencyInput: UILabel!
    
    var actionClicked : ((Float) -> Void)?
    
    override func didMoveToSuperview() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        self.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
    
    @IBAction func convertClicked(_ sender: Any) {
        if let action = actionClicked, let text = inputField.text {
            var valueString = text.replacingOccurrences(of: ",", with: ".")
            valueString = valueString.replacingOccurrences(of: " €", with: "")
            if let value = Float(valueString) {
                action(value)
            }
        }
    }
    
    
    public func displayResult(value: Float) {
        resultLabel.text = "\(value) $"
    }
}