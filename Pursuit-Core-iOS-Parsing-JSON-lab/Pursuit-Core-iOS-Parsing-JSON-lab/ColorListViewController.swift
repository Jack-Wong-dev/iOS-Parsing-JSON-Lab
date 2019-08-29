//
//  ColorListViewController.swift
//  Pursuit-Core-iOS-Parsing-JSON-lab
//
//  Created by Jack Wong on 8/28/19.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import UIKit

class ColorListViewController: UIViewController {
    
    @IBOutlet weak var tableVIew: UITableView!
    
    var colors = [Color]() {
        didSet {
            tableVIew.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableVIew.delegate = self
        tableVIew.dataSource = self
    }
    
    func loadData() {
        if let path = Bundle.main.path(forResource: "colors", ofType: "json") {
            let myURL = URL.init(fileURLWithPath: path)
            if let data = try? Data.init(contentsOf: myURL) {
                do {
                    let allColors = try JSONDecoder().decode([Color].self, from: data)
                    colors = allColors
                } catch {
                    print(error)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableVIew.indexPathForSelectedRow else { return }
        guard segue.identifier == "showColorDetailVC" else {return}
        guard let showDetailVC = segue.destination as? ColorDetailViewController else {return}
        
        showDetailVC.delegate = colors[indexPath.row]
    }
    
}

extension ColorListViewController: UITableViewDelegate {}

extension ColorListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color = colors[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        var colorValues = color.rgb
        colorValues.getValue()
        
        let red = CGFloat(colorValues.r)
        let green = CGFloat(colorValues.g)
        let blue = CGFloat(colorValues.b)
        
        cell.textLabel?.text = color.name.value
        // refactor later to convert to CGFloat
        cell.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: CGFloat(color.a))
        return cell
    }
}
