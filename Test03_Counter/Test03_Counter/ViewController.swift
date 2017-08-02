//
//  ViewController.swift
//  Test03_Counter
//
//  Created by zenit70 on 01/05/17.
//  Copyright © 2017 zenit70. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var counter:Int = 0

    @IBOutlet weak var lblCounter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPlus_Sum(_ sender: UIButton) {
        self.counter += 1
        self.lblCounter.text = String(counter)
    }
    
    @IBAction func btnMinus_Sub(_ sender: UIButton) {
        if self.counter > 0 {
            self.counter -= 1
            self.lblCounter.text = String(counter)
        }
    }
}

