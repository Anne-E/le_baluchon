//
//  TranslationViewController.swift
//  LeBaluchon
//
//  Created by Anne-Elisabeth on 30/09/2019.
//  Copyright © 2019 Anne-Elisabeth. All rights reserved.
//

import Foundation
import UIKit

class TranslationViewController: UIViewController {
    
    @IBOutlet var translationView: TranslationView!
    
    
    override func viewDidLoad() {
        translationView.actionClicked = translate(value:)
        
    }
    
    func translate(value: String) {
        print(value)
        translationView.displayResult(value: value)
    }
}
