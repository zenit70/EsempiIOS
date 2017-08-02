//
//  ViewController.swift
//  Test17_Distance
//
//  Created by Ospite on 23/05/17.
//  Copyright © 2017 zenit70. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
    var dist:Double = 0.0
    var currentLocation: CLLocation?
    var previousLocation: CLLocation?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func test() {
        dist = (currentLocation?.distance(from: previousLocation!))!
    }

}

