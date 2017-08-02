//
//  ViewController.swift
//  Test25_UInterface
//
//  Created by Ospite on 09/06/17.
//  Copyright © 2017 zenit70. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var countries:[String] = ["Italia", "Francia", "Spagna"]

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        // assegno l'identifier "cell" e i tag di button e label nal mainstoryboard
        var button = cell.viewWithTag(1) as! UIButton
        button.setImage(UIImage(named: "pause_on.png"), for: UIControlState.normal)
        var label = cell.viewWithTag(2) as! UILabel
        label.text = countries[indexPath.row]
        return cell
    }

}

