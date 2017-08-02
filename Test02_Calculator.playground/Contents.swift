//: Playground - noun: a place where people can play

import UIKit

class Calculator {
    var tot:Double = 0.0
    var result:Double = 0.0
    var operation:String
    
    // costruttore
    init(tot:Double, op:String) {
        self.tot = tot
        self.operation = op
    }
    
    // operazioni
    func Sum(n:Double) -> Double {
        return tot + n
    }
    
    func Subtraction(n:Double) -> Double {
        return tot - n
    }
    
    func Multiplication(n:Double) -> Double {
        return tot * n
    }
    
    func Division(n:Double) -> Double {
        if n != 0 {
            return tot / n
        } else {
            return 0
        }
    }
    
    // metodi
    func Calc(n:Double) -> Double {
        switch operation {
        case "+":
            result = Sum(n: n)
        case "-":
            result = Subtraction(n: n)
        case "*":
            result = Multiplication(n: n)
        case "/":
            result = Division(n: n)
        default:
            result = 0.0
        }
        return result
    }
    
    func Reset() {
        tot = 0.0
    }
}

var mTot = 5.0
var mOperation = "+"
var mCalc = Calculator(tot: mTot, op: mOperation)
var mN = 10.0
var mResult = mCalc.Calc(n: mN)
print(mResult)
mTot = mResult
mOperation = "-"
mCalc = Calculator(tot: mTot, op: mOperation)
mN = 5.0
mResult = mCalc.Calc(n: mN)
print(mResult)





