//
//  ViewController.swift
//  Test20_2d
//
//  Created by Ospite on 26/05/17.
//  Copyright © 2017 zenit70. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("View height: " + String(describing: view.bounds.size.height))
        print("View width: " + String(describing: view.bounds.size.width))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

