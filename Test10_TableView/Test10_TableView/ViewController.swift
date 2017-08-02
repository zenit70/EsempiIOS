//
//  ViewController.swift
//  Test10_TableView
//
//  Created by Ospite on 10/05/17.
//  Copyright © 2017 zenit70. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let countries = ["Vicenza", "Padova", "Venezia", "Belluno", "Treviso", "Rovigo", "Verona"]

    @IBOutlet weak var tableCountry: UITableView!
    @IBOutlet weak var labelCountry: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableCountry.delegate = self
        tableCountry.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cella:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: nil)
        cella.textLabel?.text = countries[indexPath.row]
        cella.detailTextLabel?.text = "Provincia"
        cella.textLabel?.textColor = UIColor.blue
        return cella
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        labelCountry.text = countries[indexPath.row]
    }
}

