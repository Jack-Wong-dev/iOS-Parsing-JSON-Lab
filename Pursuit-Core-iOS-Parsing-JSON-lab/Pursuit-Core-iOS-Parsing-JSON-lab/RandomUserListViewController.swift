//
//  RandomUserListViewController.swift
//  Pursuit-Core-iOS-Parsing-JSON-lab
//
//  Created by Jack Wong on 8/28/19.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import UIKit

class RandomUserListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var users = [User]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func loadData() {
        if let path = Bundle.main.path(forResource: "users", ofType: "json") {
            let myURL = URL.init(fileURLWithPath: path)
            if let data = try? Data.init(contentsOf: myURL) {
                do {
                    let allUsers = try JSONDecoder().decode([User].self, from: data)
                    users = allUsers
                } catch {
                    print(error)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard segue.identifier == "showRandomUserDetailVC" else {return}
        guard let showDetailVC = segue.destination as? RandomUserDetailViewController else {return}
        
        showDetailVC.delegate = users[indexPath.row]
    }
    
}

extension RandomUserListViewController: UITableViewDelegate {}

extension RandomUserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "randomUserCell", for: indexPath)
        
        cell.textLabel?.text = "\(user.name.first) \(user.name.last)"
        cell.detailTextLabel?.text = user.email
        return cell
    }
}
