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
        if let urlFromString = URL(string: url) {
            if self.image == nil {
                self.image = UIImage()
            }
            URLSession.shared.dataTask(with: urlFromString, completionHandler: { (data, response, error) -> Void in
                if error != nil {
                    print(error ?? "error")
                    return
                }
                DispatchQueue.main.async(execute: { () -> Void in
                    if data != nil {
                        let image = UIImage(data: data!)
                        self.image = image
                    }
                })
            }).resume()
        }
    }
}
