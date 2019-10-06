//
//  WeatherView.swift
//  LeBaluchon
//
//  Created by Anne-Elisabeth on 06/10/2019.
//  Copyright © 2019 Anne-Elisabeth. All rights reserved.
//

import Foundation
import UIKit

class WeatherView: UIView {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func setup(cityName: String, weatherImage: UIImage, temperature: Float) {
        self.cityLabel.text = cityName
        self.weatherImageView.image = weatherImage
        self.temperatureLabel.text = "\(temperature)°C"
    }
}
