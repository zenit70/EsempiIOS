//
//  ViewController.swift
//  Test12_UserDefaults
//
//  Created by zenit70 on 11/05/17.
//  Copyright © 2017 zenit70. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl1: UITextField!
    @IBOutlet weak var lbl2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initParam()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnSave(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set(self.lbl1.text, forKey: "lbl1")
        defaults.set(self.lbl2.text, forKey: "lbl2")
    }

    func initParam()
    {
        let defaults = UserDefaults.standard
        self.lbl1.text = defaults.string(forKey: "lbl1")
        self.lbl2.text = defaults.string(forKey: "lbl2")
    }
}

