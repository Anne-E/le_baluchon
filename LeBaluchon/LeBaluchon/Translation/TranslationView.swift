//
//  TranslationView.swift
//  LeBaluchon
//
//  Created by Anne-Elisabeth on 30/09/2019.
//  Copyright © 2019 Anne-Elisabeth. All rights reserved.
//

import Foundation
import UIKit

class TranslationView : UIView {
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var actionClicked : ((String) -> Void)?
    
    override func didMoveToSuperview() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        self.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
    
    @IBAction func translateClicked(_ sender: Any) {
        
        if let value: String = inputField.text,
            let action = actionClicked {
            action(value)
        }
    }
    
    
    public func displayResult(value: String) {
        resultLabel.text = "\(value)"
    }
}
