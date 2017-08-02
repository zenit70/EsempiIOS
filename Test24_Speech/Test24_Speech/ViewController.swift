//
//  ViewController.swift
//  Test24_Speech
//
//  Created by Ospite on 07/06/17.
//  Copyright © 2017 zenit70. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let speechSynth = AVSpeechSynthesizer()
    @IBOutlet weak var rate: UISlider!
    @IBOutlet weak var pitch: UISlider!
    @IBOutlet weak var volume: UISlider!
    
    
    @IBOutlet weak var myTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSpeech(_ sender: UIButton) {
        let speechUtterance = AVSpeechUtterance(string: myTextView.text)
        speechUtterance.rate = rate.value // valore da 0 a 1
        speechUtterance.pitchMultiplier = pitch.value
        speechUtterance.volume = volume.value
        
        speechSynth.speak(speechUtterance)
        
    }

}

