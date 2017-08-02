//
//  ViewController.swift
//  Test09_CocoaPods
//
//  Created by Ospite on 09/05/17.
//  Copyright © 2017 zenit70. All rights reserved.
//

import UIKit
import GaugeKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myGauge: Gauge!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myGauge.maxValue = 10
        myGauge.rate = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnAdd(_ sender: UIButton) {
        myGauge.rate += 1
    }

    @IBAction func btnSub(_ sender: UIButton) {
        if myGauge.rate > 0 {
            myGauge.rate -= 1
        }
        
    }
}

