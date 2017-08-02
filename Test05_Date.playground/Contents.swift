//: Playground - noun: a place where people can play

import UIKit

var myDate = Date()
print(myDate)
let calendar = Calendar.current
var components = (calendar as NSCalendar).components([.year, .month, .day, .hour, .minute, .second], from: myDate)
let year = components.year
let day  = components.day
let hour = components.hour