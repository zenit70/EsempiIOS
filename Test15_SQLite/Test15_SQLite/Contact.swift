//
//  Contact.swift
//  Test15_SQLite
//
//  Created by Ospite on 16/05/17.
//  Copyright © 2017 zenit70. All rights reserved.
//

import Foundation

class Contact {
    let id:Int64?
    var surname:String
    var name:String
    var phone:String
    
    init(id:Int64) {
        self.id = id
        surname = ""
        name = ""
        phone = ""
    }
    
    init (id:Int64, surname:String, name:String, phone:String) {
        self.id = id
        self.surname = surname
        self.name = name
        self.phone = phone
    }
}
