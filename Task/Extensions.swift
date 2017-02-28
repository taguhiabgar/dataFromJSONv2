//
//  Extensions.swift
//  Task
//
//  Created by Guest User on 27/02/2017.
//  Copyright © 2017 Guest User. All rights reserved.
//

import UIKit

extension UIImageView {
    
    public func imageFromUrl(url: String) {
        URLSession.shared.dataTask(with: NSURL(string: url)! as URL, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error ?? "error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
        }).resume()
    }
}
