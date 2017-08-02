//
//  Draw2D.swift
//  Test21_Graphic
//
//  Created by Ospite on 30/05/17.
//  Copyright © 2017 zenit70. All rights reserved.
//

import UIKit

class Draw2d:UIView {
    var values = [Double]()
    
    override func draw(_ rect: CGRect) {
        let viewHeight = rect.size.height
        let viewWidth = rect.size.width
        let context = UIGraphicsGetCurrentContext()
        // rettangolo esterno
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor.darkGray.cgColor)
        context?.addRect(CGRect(x:0, y:0, width: viewWidth, height: viewHeight))
        context?.strokePath()
        // assi
        context?.setLineWidth(4.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        // y
        let startPointY:CGPoint = CGPoint(x: 10, y: 10)
        let endPointY:CGPoint = CGPoint(x:10, y:(viewHeight - 10))
        context?.move(to: startPointY)
        context?.addLine(to: endPointY)
        // x
        let startPonitX:CGPoint = CGPoint(x:10, y:(viewHeight - 10))
        let endPointX:CGPoint = CGPoint(x:(viewWidth - 10), y:(viewHeight - 10))
        context?.move(to: startPonitX)
        context?.addLine(to: endPointX)
        context?.strokePath()
        // istogramma
        let xWidth = (Double(viewWidth - 20) / Double(values.count))
        let maxHeight = values.max()
        let yHeight = (Double(viewHeight - 20) / Double(maxHeight!))
        var startXGraph:Double = 10
        for v in values {
            context?.addRect(CGRect(x: startXGraph, y: Double(viewHeight - 10), width: xWidth, height: -v * yHeight))
            context?.setFillColor(UIColor.orange.cgColor)
            context?.fillPath()
            context?.setLineWidth(1.0)
            context?.setStrokeColor(UIColor.black.cgColor)
            context?.addRect(CGRect(x: startXGraph, y: Double(viewHeight - 10), width: xWidth, height: -(v * yHeight)))
            context?.strokePath()
            startXGraph += xWidth
        }
        
    }
    
    func setValues(values:[Double]) {
        self.values = values
    }
}
