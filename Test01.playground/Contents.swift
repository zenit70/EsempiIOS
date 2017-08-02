//: Playground - noun: a place where people can play

import UIKit

var str = "Ciao"

var num:Double = 10
print("Il valore di num è: \(num)")

var temperatura:Double? // variabile dichiarata come opzionale usando il ?
temperatura = 13.5
//print("Oggi ci sono \(temperatura) gradi") // warning perchè essendo la variabile optional devo aggiungere il "!"

/*if (temperatura == nil)
{
    print("Temperatura non rilevata")
}
else
{
    print("Oggi ci sono \(temperatura!) gradi")
}*/

// soluzione migliore, let serve per dichiarare una costante
if let tmpTemperatura = temperatura
{
    print("Oggi ci sono \(tmpTemperatura) gradi")
}
else
{
    print("Temperatura non rilevata")
}

// array
// dictionary
var Provincie = ["VI" : "Vicenza", "TV" : "Treviso"]
print(Provincie["VI"]!)

// ciclo for
for n in 1...5 {
    print(n)
}

for n in Provincie {
    print(n)
}

// ciclo while
var i:Int = 0
while i < 5 {
    print(i)
    i += 1
}

// ciclo do while
repeat {
    i += 1
} while i < 10

switch i {
case 1:
    print("1")
case 10:
    print("10")
default:
    print("Nessun numero")
}

// funzioni che non ritornano un valore (procedure)
func Hello() {
    print("Ciao")
}
Hello()

func Hello(myName:String) {
    print("Ciao \(myName)")
}
Hello(myName: "Fulvio")

// funzioni che ritornano un valore
func Somma(num1:Int, num2:Int) -> Int {
    return num1 + num2
}
print(Somma(num1: 2, num2: 3))

// classi
class Automobile {
    private var _colore:String = ""
    var NrRuote:Int?
    
    // costruttori
    init() {
        _colore = "Rosso"
    }
    
    init(myColor:String) {
        _colore = myColor
    }
    
    // metodo
    func Colore() -> String {
        return _colore
    }
}

var myAuto = Automobile()
myAuto.NrRuote = 4
print(myAuto.Colore())
print(myAuto.NrRuote!)

// ereditarietà
class Suv:Automobile {
    var Fari:Int = 6
    
    override func Colore() -> String {
        return "Giallo"
    }
}

var mySuv = Suv(myColor: "Nero")
print(mySuv.Colore())











