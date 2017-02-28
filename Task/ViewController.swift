//
//  ViewController.swift
//  Task
//
//  Created by Guest User on 27/02/2017.
//  Copyright © 2017 Guest User. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    var accounts = [Account]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData(url: link)
    }
    
    // MARK: - Methods
    
    private func convertToDictionary(response: DataResponse<Any>) -> Array<Account> {
        if let array = response.result.value as? Array<Dictionary<String, Any>> {
            var result: Array<Account> = []
            for dictionary in array {
                let account = Account()
                account.phone = dictionary["phone"] as? String ?? "No phone"
                account.address = dictionary["address"] as? String ?? "No address"
                account.age = dictionary["age"] as? Int64 ?? 0
                account.company = dictionary["company"] as? String ?? "No company"
                account.picture = dictionary["picture"] as? String ?? ""
                account.email = dictionary["email"] as? String ?? "No email"
                account.about = dictionary["about"] as? String ?? "No description"
                account.name = dictionary["name"] as? [String : String] ?? ["first" : "No name"]
                result.append(account)
            }
            return result
        }
        return []
    }
    
    public func requestData(url: String) {
        Alamofire.request(url).responseJSON { (responseObject) -> Void in
            self.accounts = self.convertToDictionary(response: responseObject)
        }
    }
    
    private func updateData() {
        tableView.reloadData()
    }
}

// MARK: - TableView Delegate and Datasource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let account = accounts[indexPath.row]
        let cell = UITableViewCell()
        var name = ""
        for (_, value) in account.name {
            name += value + " "
        }
        cell.textLabel?.text = name == "" ? "Name" : name
        cell.imageView?.imageFromUrl(url: account.picture)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select: #\(indexPath.row)")
        let vc = DetailViewController()
        vc.account = accounts[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}



