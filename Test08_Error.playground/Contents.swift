//: Playground - noun: a place where people can play

import UIKit

var destinatari = ["Anna", "Caterina", "Lucia"]

enum errori : Error {
    case destinatarioAssente
    case destinatarioVuoto
    case messaggioVuoto
}

func inviaMessaggio (dest:String, msg: String) throws {
    guard dest != "" else {
        throw errori.destinatarioVuoto
    }
    guard msg != "" else {
        throw errori.messaggioVuoto
    }
    var isPresent = false
    for destinatario in destinatari {
        if destinatario == dest {
            isPresent = true
        }
    }
    guard isPresent else {
        throw errori.destinatarioAssente
    }
    print("Destinatario: \(dest)")
    print("Corpo messaggio: \(msg)")
}

// caso 1
do {
    try inviaMessaggio(dest: "Anna", msg: "Bella")
}
catch errori.destinatarioAssente {
    print("Il destinatario non è nella lista")
}
catch errori.destinatarioVuoto {
    print("Inserire un destinatario")
}
catch errori.messaggioVuoto {
    print("Inserire un messaggio")
}
catch {
    print("Errore generico: \(error)")
}

// caso 2: pippo vale nil se errore
let pippo = try? inviaMessaggio(dest: "Anna", msg: "Ciao")

// caso 3: continua nonostante l'errore
try! inviaMessaggio(dest: "Caterina", msg: "Domani")
