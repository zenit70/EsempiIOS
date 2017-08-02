//
//  Page1.swift
//  Test11_MultiVC
//
//  Created by Ospite on 10/05/17.
//  Copyright © 2017 zenit70. All rights reserved.
//

import Foundation
import UIKit

class Page1:UIViewController {
    var myProperty:String = ""
    
    @IBOutlet weak var lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = myProperty
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
