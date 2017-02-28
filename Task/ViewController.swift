//
//  ViewController.swift
//  Task
//
//  Created by Guest User on 27/02/2017.
//  Copyright © 2017 Guest User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    var accounts = [Account]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readDataFromURL(urlString: link)
    }
    
    // MARK: - Methods
    
    private func readDataFromURL(urlString: String) {
//        let url = URL(string: urlString)
//        let request = NSMutableURLRequest(url: url!)
//        request.httpMethod = "GET"
        
        guard let endpoint = URL(string: urlString) else {
            print("Error creating endpoint")
            return
        }
        URLSession.shared.dataTask(with: endpoint) { (data, response, error) in
            do {
                if let data = data {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] {
                        print("data")
                        print(json)
                        print("response")
                        print(response)
                    } else {
                        print("Error: \(error)")
                    }
                }
//                
//                
//                guard let data = data else {
//                    print("Error: No data")
//                }
//                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary else {
//                    print("Error: Conversion failed")
//                }
//                print(json)
            } catch {
                print("Error: \(error)")
            }
        }.resume()
        
        
        
        
        
        
        
        
        
        
//        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) -> Void in
//            if error != nil {
//                print(error ?? "error")
//                return
//            }
//            DispatchQueue.main.async(execute: { () -> Void in
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSArray
//                    if let parseJson = json {
//                        if let accountsArray = parseJson as? [[String: Any]] {
//                            for account in accountsArray {
//                                for (key, value) in account {
//                                    let account = Account()
//                                    switch key {
//                                    case "phone":
//                                        if let phone = value as? String {
//                                            account.phone = phone
//                                        }
//                                    case "address":
//                                        if let address = value as? String {
//                                            account.address = address
//                                        }
//                                    case "age":
//                                        if let age = value as? Int64 {
//                                            account.age = age
//                                        }
//                                    case "company":
//                                        if let company = value as? String {
//                                            account.company = company
//                                        }
//                                    case "picture":
//                                        if let picture = value as? String {
//                                            account.picture = picture
//                                        }
//                                    case "email":
//                                        if let email = value as? String {
//                                            account.email = email
//                                        }
//                                    case "about":
//                                        if let about = value as? String {
//                                            account.about = about
//                                        }
//                                    case "name":
//                                        if let name = value as? [String : String] {
//                                            account.name = name
//                                        }
//                                    default: print()
//                                    }
//                                    self.accounts.append(account)
//                                }
//                            }
//                            self.updateData()
//                        }
//                    }
//                } catch {
//                    print("Error: \(error)")
//                }
//            })
//        }).resume()
        
        
        
//        
//        DispatchQueue.main.async(execute: {
//            let task = URLSession.shared.dataTask(with: request as URLRequest) {
//                data, response, error in
//                if error != nil {
//                    print("Error: \(error!.localizedDescription)")
//                    DispatchQueue.main.sync(execute: {})
//                    return
//                }
//                
//                DispatchQueue.main.async(execute: {
//                    do {
//                        let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSArray
//                        if let parseJson = json {
//                            if let accountsArray = parseJson as? [[String: Any]] {
//                                for account in accountsArray {
//                                    for (key, value) in account {
//                                        let account = Account()
//                                        switch key {
//                                        case "phone":
//                                            if let phone = value as? String {
//                                                account.phone = phone
//                                            }
//                                        case "address":
//                                            if let address = value as? String {
//                                                account.address = address
//                                            }
//                                        case "age":
//                                            if let age = value as? Int64 {
//                                                account.age = age
//                                            }
//                                        case "company":
//                                            if let company = value as? String {
//                                                account.company = company
//                                            }
//                                        case "picture":
//                                            if let picture = value as? String {
//                                                account.picture = picture
//                                            }
//                                        case "email":
//                                            if let email = value as? String {
//                                                account.email = email
//                                            }
//                                        case "about":
//                                            if let about = value as? String {
//                                                account.about = about
//                                            }
//                                        case "name":
//                                            if let name = value as? [String : String] {
//                                                account.name = name
//                                            }
//                                        default: print()
//                                        }
//                                        self.accounts.append(account)
//                                    }
//                                }
//                                self.updateData()
//                            }
//                        }
//                    } catch {
//                        print("Error: \(error)")
//                    }
//                })
//                
//                
//            }
//            task.resume()
//        })
//        
        
        
        
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



