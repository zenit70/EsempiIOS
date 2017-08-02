//
//  ViewController.swift
//  Test18_Gesture
//
//  Created by zenit70 on 25/05/17.
//  Copyright © 2017 zenit70. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viewColor: UIView!
    @IBOutlet weak var imgZoom: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        viewColor.backgroundColor = UIColor.blue
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        viewColor.backgroundColor = UIColor.darkGray
    }
    
    @IBAction func zoom(_ sender: UIPinchGestureRecognizer) {
        imgZoom.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
    }
}

