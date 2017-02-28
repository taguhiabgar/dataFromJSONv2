//
//  Person.swift
//  Task
//
//  Created by Guest User on 27/02/2017.
//  Copyright © 2017 Guest User. All rights reserved.
//

import Foundation

class Account {
    
    public var phone: String
    public var address: String
    public var age: Int64
    public var company: String
    public var picture: String
    public var email: String
    public var about: String
    public var name: [String : String]
    
    init() {
        self.phone = ""
        self.address = ""
        self.age = 0
        self.company = ""
        self.picture = ""
        self.email = ""
        self.about = ""
        self.name = [ : ]
    }
    
    init(phone: String, address: String, age: Int64, company: String, picture: String, email: String, about: String, name: [String : String]) {
        self.phone = phone
        self.address = address
        self.age = age
        self.company = company
        self.picture = picture
        self.email = email
        self.about = about
        self.name = name
    }
}
