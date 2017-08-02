//
//  Draw2D.swift
//  Test20_2d
//
//  Created by Ospite on 26/05/17.
//  Copyright © 2017 zenit70. All rights reserved.
//

import UIKit

class Draw2d:UIView {
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor.red.cgColor)
        let startPoint:CGPoint = CGPoint(x: 20, y: 30)
        let endPoint:CGPoint = CGPoint(x: 50, y: 80)
        context?.move(to: startPoint)
        context?.addLine(to: endPoint)
        context?.addLine(to: CGPoint(x: 50, y: 160))
        
        context?.addRect(CGRect(x: 100, y: 100, width: 200, height: 100))
        
        context?.setFillColor(UIColor.blue.cgColor)
        context?.fillPath()
        
        context?.strokePath()
        
        print("Height: " + String(describing: rect.size.height))
        print("Width: " + String(describing: rect.size.width))
    }
}
