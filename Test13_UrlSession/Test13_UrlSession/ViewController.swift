//
//  ViewController.swift
//  Test13_UrlSession
//
//  Created by Ospite on 12/05/17.
//  Copyright © 2017 zenit70. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        callMyWS()
        print("Call OK")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func callMyWS() {
        let myUrl = URL(string: "http://api.fixer.io/latest")!
        var myRequest = URLRequest(url: myUrl)
        myRequest.httpMethod = "POST"
        // chiamata asincrona
        let mySession = URLSession.shared.dataTask(with: myUrl) { (data, response, error) in
            if let myError = error {
                print("Errore di chiamata: \(error?.localizedDescription)")
            } else {
                let myResponse = (response as! HTTPURLResponse)
                if myResponse.statusCode == 200 {
                    print(self.json_parseData(data!))
                } else {
                    print("Errore in response: \(myResponse.description)")
                }
            }
        }
        mySession.resume() // fa partire il task
        print("Fine chiamata")
    }
    
    func json_parseData( _ data: Data) -> NSDictionary? {
        do
        {
            let json: Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
            
            return (json as? NSDictionary)
        }
        catch
        {
            print ("Errore: Json data not correct")
            return nil
        }
    }
}

