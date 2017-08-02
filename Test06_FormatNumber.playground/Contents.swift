//: Playground - noun: a place where people can play

import UIKit

var euro:Double = 10.12345

func formatValue(value: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.maximumFractionDigits = 2;
    formatter.locale = Locale(identifier: Locale.current.identifier)
    let result = formatter.string(from: value as NSNumber);
    return result!;
}

var euroFormat:String = formatValue(value: euro)
print(euroFormat)
