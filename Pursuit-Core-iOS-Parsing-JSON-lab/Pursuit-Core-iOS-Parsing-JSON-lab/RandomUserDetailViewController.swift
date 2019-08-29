//
//  RandomUserDetailViewController.swift
//  Pursuit-Core-iOS-Parsing-JSON-lab
//
//  Created by Jack Wong on 8/28/19.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import UIKit

class RandomUserDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    
    
    var delegate: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let info = delegate{
            nameLabel.text = "\(info.name.first) \(info.name.last)"
            streetLabel.text = info.location.street
            cityLabel.text = info.location.city
            stateLabel.text = info.location.state
            zipLabel.text = "\(info.location.postcode)"
            phoneLabel.text = info.phone
            dobLabel.text = "\(info.dob)"
        }

    }
    

  
}
