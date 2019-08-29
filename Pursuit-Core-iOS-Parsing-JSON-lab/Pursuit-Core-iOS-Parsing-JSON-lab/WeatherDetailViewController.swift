//
//  WeatherDetailViewController.swift
//  Pursuit-Core-iOS-Parsing-JSON-lab
//
//  Created by Jack Wong on 8/27/19.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var weatherLabel: UILabel!
    
    var delegate: CityInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let info = delegate{
            weatherLabel.text = info.weather[0].description
            temperatureLabel.text = "Temperature: \(info.main.temp)"
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
