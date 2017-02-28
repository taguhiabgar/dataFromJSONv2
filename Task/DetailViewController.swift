//
//  DetailViewController.swift
//  Task
//
//  Created by Guest User on 27/02/2017.
//  Copyright © 2017 Guest User. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    // account
    static public var account: Account?
    // image view
    @IBOutlet weak var imageView: UIImageView!
    // views
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var contactView: UIView!
    @IBOutlet weak var aboutView: UIView!
    // labels
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.white
        updateView()
    }
    
    // MARK: - Methods
    
    private func updateView() {
        if DetailViewController.account != nil {
            let validAccount = DetailViewController.account!
            imageView.imageFromUrl(url: validAccount.picture)
            let nameLabelText = validAccount.nameToString() + "(age of \(validAccount.age))"
            nameLabel.text = nameLabelText
            companyLabel.text = "Works at \(validAccount.company)"
            addressLabel.text = validAccount.address
            phoneLabel.text = validAccount.phone
            emailLabel.text = validAccount.email
            aboutLabel.numberOfLines = 0
            aboutLabel.text = validAccount.about
        }
    }
}
