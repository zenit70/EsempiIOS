//
//  ViewController.swift
//  Test21_Graphic
//
//  Created by Ospite on 30/05/17.
//  Copyright © 2017 zenit70. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let values:[Double]  = [4.2, 3.6, 5.3, 2.1, 4.9]

    @IBOutlet weak var myGraphic: Draw2d!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myGraphic.setValues(values: values)
        myGraphic.draw(myGraphic.bounds)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

