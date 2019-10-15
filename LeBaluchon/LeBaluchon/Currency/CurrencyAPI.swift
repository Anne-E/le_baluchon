//
//  CurrencyAPI.swift
//  LeBaluchon
//
//  Created by Anne-Elisabeth on 06/10/2019.
//  Copyright © 2019 Anne-Elisabeth. All rights reserved.
//

import Foundation

class CurrencyAPI {
    
    public static let shared = CurrencyAPI()
    
    private let urlString: String = "http://data.fixer.io/api/latest?access_key=" + Configuration.FixerAPIKey
    private let lastUpdateKey = "lastCurrencyUpdate"
    private let lastResultKey = "lastCurrencyResult"
    private var result: Double?
    
    private let currency = "USD"
    private let rates = "rates"
    private let refreshInterval: TimeInterval = 2628
    
    init() {
        let userDefaults = UserDefaults.standard
        result = userDefaults.object(forKey: lastResultKey) as? Double
    }
    
    func getCurrency(completion: @escaping (Bool, Double?) -> Void) {
        let userDefaults = UserDefaults.standard
        
        if let lastUpdate = userDefaults.object(forKey: lastUpdateKey) as? Date {
            if lastUpdate.addingTimeInterval(self.refreshInterval) < Date() {
                    updateCurrency(completion: completion)
                } else {
                    completion(result != nil, result)
                }
        } else {
            updateCurrency(completion: completion)
        }
    }
    
    private func updateCurrency(completion: @escaping ((Bool, Double?) -> Void)) {
        if let url: URL = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                if let data = data {
                    let json = try! JSONSerialization.jsonObject(with: data, options: [])
                    if let object = json as? [String: Any] {
                        if let ratesValue : [String: Any] = object[self.rates] as? [String : Any],
                            let result: NSNumber = ratesValue[self.currency] as? NSNumber {
                            debugPrint("Result updated")
                            self.result = result.doubleValue
                            completion(true, self.result)
                            UserDefaults.standard.setValue(Date(), forKey: self.lastUpdateKey)
                            UserDefaults.standard.setValue(self.result, forKey: self.lastResultKey)
                        } else {
                            debugPrint("Can not create float from USD field")
                            completion(false, self.result)
                        }
                    }
                    else {
                        debugPrint("Can not create dictionnary from json")
                         completion(false, self.result)
                    }
                } else if let error = error {
                    debugPrint("Can not retrieve currency \(error)")
                     completion(false, self.result)
                } else {
                    debugPrint("Can not retrieve currency unknown error")
                    completion(false, self.result)
                }
            }
            task.resume()
        } else {
            debugPrint("Can not create url")
            completion(false, self.result)
        }
    }
}
