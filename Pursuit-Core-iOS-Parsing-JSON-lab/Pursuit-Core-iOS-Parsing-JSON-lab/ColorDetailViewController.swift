//
//  ColorDetailViewController.swift
//  Pursuit-Core-iOS-Parsing-JSON-lab
//
//  Created by Jack Wong on 8/28/19.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!
    
    var delegate: Color?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let info = delegate{
            var color = info.rgb
            color.getValue()
            
            let red = CGFloat(color.r)
            let green = CGFloat(color.g)
            let blue = CGFloat(color.b)
            let hex = info.hex.value
            
            // refactor later to round digits
            redLabel.text = "Red: \(red)"
            greenLabel.text = "Green: \(green)"
            blueLabel.text = "Blue: \(blue)"
            hexLabel.text = "Hex: \(hex)"
        }

        // Do any additional setup after loading the view.
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
