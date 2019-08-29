//
//  WeatherViewController.swift
//  Pursuit-Core-iOS-Parsing-JSON-lab
//
//  Created by Jack Wong on 8/27/19.
//  Copyright © 2019 Jack Wong. All rights reserved.
//
import UIKit

class WeatherViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    
    var cities: [CityInfo] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
    }
    
    func loadData() {
        if let path = Bundle.main.path(forResource: "city", ofType: "json") {
            let myURL = URL.init(fileURLWithPath: path)
            if let data = try? Data.init(contentsOf: myURL) {
                do {
                    let city = try JSONDecoder().decode(Cities.self, from: data)
                    cities = city.list
                } catch {
                    print(error)
                }
            }
        }
    }
    

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard segue.identifier == "showWeatherDetailVC" else {return}
        guard let showDetailVC = segue.destination as? WeatherDetailViewController else {return}
       
        showDetailVC.delegate = cities[indexPath.row]
     }
    
}

extension WeatherViewController: UITableViewDelegate{
    
}

extension WeatherViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        
        let city = cities[indexPath.row]
        cell.textLabel?.text = city.self.name
        return cell
    }
    
}


